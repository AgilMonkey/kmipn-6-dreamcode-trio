extends Area2D


func interact():
	var all_interact = get_overlapping_areas()
	for obj: Interactable in all_interact:
		obj.interact()
		break
