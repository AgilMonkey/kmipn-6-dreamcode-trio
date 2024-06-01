extends Node


signal changing_scene_started
signal changing_scene_ended

var from: String  # Variabel buat memberitahu ruang sebelumnya

var is_changing_scene := false


func change_scene_with_transition(scene):
	if is_changing_scene:
		return
	
	is_changing_scene = true
	SceneTransition.start_transition(SceneTransition.FADE_TO_BLACK)
	await SceneTransition.transition_in_middle
	if scene is PackedScene:
		get_tree().call_deferred("change_scene_to_packed", scene)
	else:
		get_tree().call_deferred("change_scene_to_file", scene)
	is_changing_scene = false
