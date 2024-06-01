extends Area2D

signal interacted

var is_interacting: bool

func _input(event):
	if Input.is_action_just_pressed("interact") and is_interacting:
		print("button pressed")
		interacted.emit()

func _on_area_entered(area):
	print("button area entered")
	is_interacting = true

func _on_area_exited(area):
	print("button area exited")	
	is_interacting = false
