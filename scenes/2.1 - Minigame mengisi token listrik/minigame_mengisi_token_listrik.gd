extends Node2D

signal minigame_selesai

@onready var anim_minigame = $AnimationMinigame

func selesaikan_game():
	anim_minigame.play("end_game")

func tween_tangan_ke_bawah():
	var to = Vector2($HandPointing.global_position.x, 1080)
	var tween = get_tree().create_tween()
	tween.tween_property($HandPointing, "global_position", to, 2)
	print("Minigame selesai")
	minigame_selesai.emit()
