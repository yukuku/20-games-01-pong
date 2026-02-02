extends AnimatableBody2D

@export var speed: float = 500.0
@export var up_action: String = "ui_up"
@export var down_action: String = "ui_down"
@export var min_y: float = 66.0
@export var max_y: float = 654.0

func _physics_process(delta: float) -> void:
	var dir := 0.0
	if Input.is_action_pressed(up_action):
		dir -= 1.0
	elif Input.is_action_pressed(down_action):
		dir += 1.0
		
	var new_y := position.y + dir * speed * delta
	position.y = clamp(new_y, min_y, max_y)
