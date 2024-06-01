extends InteractArea


signal change_scene

var is_changing_scene: bool


func _ready():
	interact = func():
		if not is_changing_scene:
			change_scene.emit()
			is_changing_scene = true
			await SceneTransition.transition_in_middle
