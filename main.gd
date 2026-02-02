extends Node2D

@export var score_left: int = 0
@export var score_right: int = 0

@onready var bola: CharacterBody2D = $Bola
@onready var bola_posisi_awal: Vector2 = bola.position



func _on_goal_left_body_entered(body: Node2D) -> void:
	if body == bola:
		score_right += 1
		ulang_dr_tengah()
		apdet_skor()

func _on_goal_right_body_entered(body: Node2D) -> void:
	if body == bola:
		score_left += 1
		ulang_dr_tengah()
		apdet_skor()
		
func ulang_dr_tengah():
	bola.position = bola_posisi_awal
	bola.start()

func apdet_skor():
	$HUD/SkorLeft.text = str(score_left)
	$HUD/SkorRight.text = str(score_right)
	
