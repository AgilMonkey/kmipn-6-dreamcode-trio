extends InteractArea


@export_file("*.dtl") var timeline_path = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	interact = func():
		Dialogic.start(timeline_path)
		await Dialogic.timeline_ended
