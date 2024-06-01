extends Area2D

signal interacted

var is_interacting: bool


func _input(event):
	if Input.is_action_just_pressed("interact") and is_interacting:
		interacted.emit()


func _on_area_entered(area):
	is_interacting = true


func _on_area_exited(area):
	is_interacting = false
