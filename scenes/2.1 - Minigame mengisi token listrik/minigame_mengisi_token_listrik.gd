extends Node2D

signal minigame_selesai

@onready var anim_minigame = $AnimationMinigame
var token_code = 17345

func selesaikan_game():
	minigame_selesai.emit()
	print("Minigame selesai")

func number_pressed(object):
	print("number_pressed")

func number_released(object):
	print("number_released")
