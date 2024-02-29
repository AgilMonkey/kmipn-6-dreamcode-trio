extends Area2D


func _process(delta):
	if Input.is_action_just_pressed("interact"):
		var all_interact = get_overlapping_areas()
		for obj: Interactable in all_interact:
			obj.interact()
			break
