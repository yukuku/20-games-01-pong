extends CharacterBody2D

@export var speed: float = 400.0
@export var up_action: String = "ui_up"
@export var down_action: String = "ui_down"

func _physics_process(delta: float) -> void:
	var dir := 0.0
	if Input.is_action_pressed(up_action):
		dir -= 1.0
	elif Input.is_action_pressed(down_action):
		dir += 1.0
		
	velocity = Vector2(0, dir * speed)
	move_and_slide()
