extends Area2D

signal interacting_this
signal stop_interacting_this
var can_interact: bool = false

signal on_change_scene

func _input(event):
	if Input.is_action_just_pressed("interact") and can_interact:
		can_interact = false
		on_change_scene.emit()


func _on_body_entered(body):
	can_interact = true


func _on_body_exited(body):
	can_interact = false

