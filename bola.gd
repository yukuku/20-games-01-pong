extends CharacterBody2D

@export var initial_speed: float = 300.0
var speed: float
var dir: Vector2

func _ready() -> void:
	start()

func start() -> void:
	speed = initial_speed
	var angle := randf_range(-PI/4, PI/4)
	if randi() % 2 == 0:
		angle += PI
	dir = Vector2.LEFT.rotated(angle)

func _physics_process(delta: float) -> void:
	velocity = dir * speed
	
	move_and_slide()
	if get_slide_collision_count() > 0:
		var collision = get_slide_collision(0)
		dir = dir.bounce(collision.get_normal())
		
