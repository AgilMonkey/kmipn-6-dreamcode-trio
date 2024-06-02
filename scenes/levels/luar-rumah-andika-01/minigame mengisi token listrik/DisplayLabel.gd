extends Label

const IDLE_TEXT = "ISI TOKEN"
const WRONG_TEXT = "TOKEN SALAH"
const RIGHT_TEXT = "TOKEN TERISI"
const TOKEN = "17345"
const MAX_NUMBER = 5

var current_number = 0
var current_token = ""

func _ready():
	text = IDLE_TEXT

func fill_token(value):
	if len(value) <= 2:
		if len(current_token) < MAX_NUMBER:
			current_number += 1
			current_token = current_token + value
			text = current_token
	elif value == "Back":
		if len(current_token) > 0:
			current_number -= 1
			current_token[current_number] = ""
			text = current_token
			if current_number == 0:
				text = IDLE_TEXT
	elif value == "Enter":
		if current_token != TOKEN:
			text = WRONG_TEXT
			current_number = 0
			current_token = ""
		else:
			text = RIGHT_TEXT
			get_parent().get_parent().selesaikan_game()
	print("current numbers: " + str(current_number))

func _on_button_area_signal_button(value):
	fill_token(value)
