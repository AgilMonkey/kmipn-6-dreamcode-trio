extends InteractArea


signal change_scene


func _ready():
	interact = func():
		change_scene.emit()
