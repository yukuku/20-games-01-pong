extends AnimatableBody2D

@export var speed: float = 300.0
@export var min_y: float = 66.0
@export var max_y: float = 654.0

var bola: Node2D
var laziness: float = 0.0
var panic_mode: bool = false
var power: bool = false

func _ready() -> void:
	bola = %Bola

func _physics_process(delta: float) -> void:
	if not bola:
		return

	if randf() < 0.02 and laziness <= 0:
		laziness = randf_range(0.3, 1.5)
		power = randi() % 2 == 0
		print('I am lazy')
	laziness -= delta

	if laziness > 0:
		return

	print('I am not lazy')

	panic_mode = power and (bola.velocity.x > 0 and bola.position.x > 600)

	var current_speed := speed
	if panic_mode:
		current_speed = speed * 2 

	# Follow the ball (with some offset to make mistakes)
	var target_y := bola.position.y
	if not panic_mode:
		target_y += randf_range(-30, 30)  # Slight misjudgment

	var dir := 0.0
	if position.y < target_y - 25:
		dir = 1.0
	elif position.y > target_y + 25:
		dir = -1.0

	var new_y := position.y + dir * current_speed * delta
	new_y = clamp(new_y, min_y, max_y)
	position.y = new_y
