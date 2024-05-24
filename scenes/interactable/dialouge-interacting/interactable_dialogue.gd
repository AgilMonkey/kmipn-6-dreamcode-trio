extends Interactable
class_name InteractableDialogue


@export_file var timeline_path = ""


func interact():
	var layout = Dialogic.start(timeline_path)
	return layout
