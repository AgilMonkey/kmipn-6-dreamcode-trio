extends Interactable
class_name InteractableDialogue


@export var timeline_name := ""


func interact():
	var layout = Dialogic.start(timeline_name)
	return layout
