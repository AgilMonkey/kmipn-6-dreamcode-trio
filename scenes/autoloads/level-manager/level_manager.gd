extends Node


signal changing_scene_started
signal changing_scene_ended

var from: String  # Variabel buat memberitahu ruang sebelumnya

var is_changing_scene := false


func change_scene_with_transition(packed_scene: PackedScene):
	if is_changing_scene:
		return
	
	is_changing_scene = true
	SceneTransition.start_transition(SceneTransition.FADE_TO_BLACK)
	await SceneTransition.transition_in_middle
	get_tree().call_deferred("change_scene_to_packed", packed_scene)
	is_changing_scene = false
