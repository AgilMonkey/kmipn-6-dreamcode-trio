extends InteractArea
class_name InteractDialogue


@export_file("*.dtl") var timeline_path = ""

signal dialogue_started(layout)


# Called when the node enters the scene tree for the first time.
func _ready():
	interact = func():
		print(interacted_count)
		var layout = Dialogic.start(timeline_path)
		layout.register_character(load("res://dialogic-stuff/characters/Andika.dch"), InteractManager.player.text_bubble_pivot)
		dialogue_started.emit(layout)
		await Dialogic.timeline_ended
		InteractManager.dialogic_layout = null
