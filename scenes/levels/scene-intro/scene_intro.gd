extends Node2D


signal pressing_anything

@onready var animation_intro := $AnimationIntro


func _input(event):
	if Input.is_anything_pressed():
		pressing_anything.emit()

func tunggu_input():
	await pressing_anything
	animation_intro.play("end_intro")


func end_intro():
	SceneTransition.start_transition(SceneTransition.FADE_TO_BLACK)
	await SceneTransition.transition_in_middle
	get_tree().change_scene_to_file("res://scenes/levels/kamar-andika-01/kamar_andika_01.tscn")
