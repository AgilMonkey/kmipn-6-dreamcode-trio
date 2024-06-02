extends Node2D



var text_code: String



func _on_jalankan_button_button_down():
	text_code = %CodeTextEdit.text
	print(text_code)
