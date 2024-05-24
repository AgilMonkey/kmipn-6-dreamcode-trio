extends Node2D

var direction: Vector2

func _input(event):
	direction = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down")).normalized()
	
	if event.is_action_pressed("interact"):
		
		pass
	elif event.is_action_released("interact"):
		pass
