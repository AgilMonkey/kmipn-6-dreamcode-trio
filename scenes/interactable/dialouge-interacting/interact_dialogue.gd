extends InteractArea


@export_file("*.dtl") var timeline_path = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	interact = func():
		var layout = Dialogic.start(timeline_path)
		layout.register_character(load("res://dialogic-stuff/characters/Andika.dch"), InteractManager.player.text_bubble_pivot)
		await Dialogic.timeline_ended
		InteractManager.dialogic_layout = null
