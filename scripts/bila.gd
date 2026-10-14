class_name Bila
extends RigidBody2D
## Uma bila: recebe lançamentos, quica e avisa quando para.

signal parou

@export var raio: float = 10.0
@export var cor: Color = Color.CORNFLOWER_BLUE
@export var atrito: float = 1.5         ## quanto maior, mais rápido a bila para
@export var limite_parada: float = 8.0   ## abaixo dessa velocidade (px/s) a bila é considerada parada

var em_movimento: bool = false           ## atualizado sozinho, vale para qualquer bila
var conquistada: bool = false           ## true depois que sai do triângulo; some quando parar


func _ready() -> void:
	gravity_scale = 0.0                  # visão de cima: sem gravidade
	linear_damp = atrito
	lock_rotation = true                 # bila 2D lisa, sem girar
	continuous_cd = RigidBody2D.CCD_MODE_CAST_RAY  # evita atravessar paredes em alta velocidade

	var material := PhysicsMaterial.new()
	material.bounce = 0.8
	material.friction = 0.2
	physics_material_override = material

	var forma := CollisionShape2D.new()
	var circulo := CircleShape2D.new()
	circulo.radius = raio
	forma.shape = circulo
	add_child(forma)


func _draw() -> void:
	# Desenho provisório (placeholder). Depois vira Sprite2D com a skin.
	draw_circle(Vector2.ZERO, raio, cor)
	draw_arc(Vector2.ZERO, raio, 0.0, TAU, 32, Color(0, 0, 0, 0.4), 2.0)


func lancar(direcao: Vector2, forca: float) -> void:
	apply_central_impulse(direcao.normalized() * forca)


func _physics_process(_delta: float) -> void:
	var andando := linear_velocity.length() >= limite_parada
	if not andando and linear_velocity != Vector2.ZERO:
		linear_velocity = Vector2.ZERO   # para de vez, sem ficar se arrastando
	if andando:
		em_movimento = true
	elif em_movimento:
		em_movimento = false
		parou.emit()