extends Node2D
## Etapa 3: mesa com triângulo e conquista de bilas.
## Arraste o mouse para trás (como na sinuca) e solte para lançar.

signal jogada_terminou   ## emitido quando TODAS as bilas pararam depois de um lançamento

@export var area_jogo: Rect2 = Rect2(100, 60, 1080, 600)
@export var forca_max: float = 1600.0    ## impulso aplicado com o arrasto no máximo
@export var arrasto_max: float = 200.0   ## tamanho máximo do arrasto, em pixels
@export var apostas_por_lado: int = 6    ## provisório: depois vem da tela de aposta (1 a 6)

var bilas: Array[Bila] = []
var bila_jogador: Bila
var triangulo: Triangulo
var coletadas: int = 0
var arrastando: bool = false
var jogada_ativa: bool = false           ## true do lançamento até todas pararem
var frames_espera: int = 0               ## dá tempo da física começar a mover as bilas
var ponto_inicial: Vector2 = Vector2.ZERO
var ponto_atual: Vector2 = Vector2.ZERO


func _ready() -> void:
	_criar_paredes(area_jogo)

	triangulo = Triangulo.new()
	triangulo.position = Vector2(850, 360)
	add_child(triangulo)

	bila_jogador = _criar_bila(Vector2(300, 360), Color.ORANGE)
	var posicoes := triangulo.posicoes_para_bilas(apostas_por_lado * 2, 16.0)
	for posicao in posicoes:
		_criar_bila(posicao, Color.CORNFLOWER_BLUE)

	triangulo.bila_saiu.connect(_ao_bila_sair_do_triangulo)
	jogada_terminou.connect(_ao_terminar_jogada)


func _criar_bila(posicao: Vector2, cor: Color) -> Bila:
	var bila := Bila.new()
	bila.position = posicao
	bila.cor = cor
	add_child(bila)
	bilas.append(bila)
	bila.parou.connect(_ao_bila_parar.bind(bila))
	return bila


func _criar_paredes(r: Rect2) -> void:
	var e := 40.0  # espessura das paredes
	var lados: Array[Rect2] = [
		Rect2(r.position.x - e, r.position.y - e, r.size.x + 2 * e, e),  # topo
		Rect2(r.position.x - e, r.end.y, r.size.x + 2 * e, e),           # base
		Rect2(r.position.x - e, r.position.y, e, r.size.y),              # esquerda
		Rect2(r.end.x, r.position.y, e, r.size.y),                       # direita
	]
	for lado in lados:
		var corpo := StaticBody2D.new()
		var forma := CollisionShape2D.new()
		var retangulo := RectangleShape2D.new()
		retangulo.size = lado.size
		forma.shape = retangulo
		corpo.position = lado.get_center()
		corpo.add_child(forma)
		add_child(corpo)


func _unhandled_input(evento: InputEvent) -> void:
	if evento is InputEventMouseButton and evento.button_index == MOUSE_BUTTON_LEFT:
		if evento.pressed and not jogada_ativa:
			arrastando = true
			ponto_inicial = get_global_mouse_position()
			ponto_atual = ponto_inicial
		elif not evento.pressed and arrastando:
			arrastando = false
			_lancar()
	elif evento is InputEventMouseMotion and arrastando:
		ponto_atual = get_global_mouse_position()
	queue_redraw()


func _vetor_arrasto() -> Vector2:
	# Direção do tiro = oposta ao arrasto, como puxar o taco para trás.
	return (ponto_inicial - ponto_atual).limit_length(arrasto_max)


func _lancar() -> void:
	var vetor := _vetor_arrasto()
	if vetor.length() < 10.0:
		return  # arrasto muito curto, ignora
	var forca := vetor.length() / arrasto_max * forca_max
	bila_jogador.lancar(vetor, forca)
	jogada_ativa = true
	frames_espera = 3


func _physics_process(_delta: float) -> void:
	if not jogada_ativa:
		return
	if frames_espera > 0:
		frames_espera -= 1
		return
	for bila in bilas:
		if bila.em_movimento:
			return                       # ainda tem bila andando
	jogada_ativa = false
	jogada_terminou.emit()


func _ao_bila_sair_do_triangulo(bila: Bila) -> void:
	# A bila do jogador pode sair sem ser conquistada. Só as bilas alvo contam.
	if bila == bila_jogador or bila.conquistada or not bilas.has(bila):
		return
	bila.conquistada = true
	coletadas += 1
	queue_redraw()
	# A bila continua deslizando; ela só some quando parar (veja _ao_bila_parar).
	if not bila.em_movimento:
		_remover_bila(bila)


func _ao_bila_parar(bila: Bila) -> void:
	if bila.conquistada:
		_remover_bila(bila)


func _remover_bila(bila: Bila) -> void:
	if not bilas.has(bila):
		return
	bilas.erase(bila)
	bila.collision_layer = 0   # deixa de colidir enquanto some
	bila.collision_mask = 0
	var tween := create_tween()
	tween.tween_property(bila, "modulate:a", 0.0, 0.3)
	tween.tween_callback(bila.queue_free)


func _ao_terminar_jogada() -> void:
	# Por enquanto só avisa. Na etapa 4, o gerenciador de partida escuta este sinal.
	print("Jogada terminou. Bilas coletadas: %d" % coletadas)


func _draw() -> void:
	draw_rect(area_jogo, Color("#d9c28f"))  # areia provisória
	draw_string(ThemeDB.fallback_font, Vector2(110, 40),
		"Bilas coletadas: %d" % coletadas,
		HORIZONTAL_ALIGNMENT_LEFT, -1, 24, Color.WHITE)
	if arrastando:
		var vetor := _vetor_arrasto()
		draw_line(bila_jogador.position, bila_jogador.position + vetor, Color.WHITE, 3.0)