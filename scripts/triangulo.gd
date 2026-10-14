class_name Triangulo
extends Area2D
## O triângulo riscado no chão. Não colide com as bilas: só detecta quando
## uma bila entra e quando sai POR COMPLETO (body_exited só dispara quando
## a bila deixa de encostar na área).

signal bila_saiu(bila: Bila)

@export var lado: float = 300.0
@export var cor_borda: Color = Color("#5a4630")

var pontos: PackedVector2Array
var bilas_dentro: Array[Bila] = []


func _ready() -> void:
	# Triângulo equilátero com a ponta virada para o jogador (esquerda).
	# A origem (0, 0) fica no centro do triângulo.
	var altura := lado * sqrt(3.0) / 2.0
	pontos = PackedVector2Array([
		Vector2(-altura * 2.0 / 3.0, 0.0),
		Vector2(altura / 3.0, -lado / 2.0),
		Vector2(altura / 3.0, lado / 2.0),
	])
	var forma := CollisionPolygon2D.new()
	forma.polygon = pontos
	add_child(forma)
	body_entered.connect(_ao_entrar)
	body_exited.connect(_ao_sair)


func _ao_entrar(corpo: Node2D) -> void:
	if corpo is Bila and not bilas_dentro.has(corpo):
		bilas_dentro.append(corpo)


func _ao_sair(corpo: Node2D) -> void:
	if corpo is Bila:
		bilas_dentro.erase(corpo)
		bila_saiu.emit(corpo)


func posicoes_para_bilas(quantidade: int, raio_bila: float) -> Array[Vector2]:
	## Devolve posições (no espaço da mesa) para encaixar as bilas apostadas
	## dentro do triângulo, das mais centrais para as mais afastadas.
	var resultado: Array[Vector2] = []
	var margem := raio_bila + 6.0
	var encolhido := Geometry2D.offset_polygon(pontos, -margem)
	if encolhido.is_empty():
		return resultado
	var area_segura: PackedVector2Array = encolhido[0]

	var candidatos: Array[Vector2] = []
	var passo := raio_bila * 2.0 + 4.0
	var x := -lado
	while x <= lado:
		var y := -lado
		while y <= lado:
			var p := Vector2(x, y)
			if Geometry2D.is_point_in_polygon(p, area_segura):
				candidatos.append(p)
			y += passo
		x += passo

	candidatos.sort_custom(func(a: Vector2, b: Vector2) -> bool: return a.length() < b.length())
	for i in mini(quantidade, candidatos.size()):
		resultado.append(candidatos[i] + position)
	if candidatos.size() < quantidade:
		push_warning("Triângulo pequeno demais para %d bilas" % quantidade)
	return resultado


func _draw() -> void:
	draw_colored_polygon(pontos, Color(0, 0, 0, 0.08))
	var contorno: PackedVector2Array = pontos.duplicate()
	contorno.append(pontos[0])
	draw_polyline(contorno, cor_borda, 4.0)
