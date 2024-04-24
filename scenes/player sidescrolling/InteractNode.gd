extends Area2D


func interact():
	var all_interact = get_overlapping_areas()
	for obj: Interactable in all_interact:
		if obj is InteractableDialogue:
			var layout = obj.interact()
			layout.register_character(load("res://dialogic-stuff/characters/test_mc.dch"), $TextBubblePivot)
		obj.interact()
		break
