extends Area2D

var can_interact: bool = false

signal on_change_scene

func _input(event):
	if Input.is_action_just_pressed("interact") and can_interact:
		on_change_scene.emit()


func _on_body_entered(body):
	can_interact = true


func _on_body_exited(body):
	can_interact = false
