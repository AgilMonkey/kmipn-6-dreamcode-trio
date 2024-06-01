extends Node2D

var scene_ruang_tamu: String = "res://scenes/levels/ruang-tamu-01/ruang_tamu_01.tscn"


func _ready():
	var from_pos: Node2D = get_node(LevelManager.from + "Pos")
	if from_pos != null:
		$Player.position = from_pos.position
		$Player.smoothing.teleport()
	
	var win_size = DisplayServer.window_get_size() as Vector2
	$Player.flip_h(win_size.x/2 < $Player.global_position.x)


func _on_area_2d_ke_ruang_tamu_body_entered(body):
	LevelManager.from = "Dapur"
	$Player.set_process_input(false)
	$Player.direction = Vector2.ZERO
	SceneTransition.start_transition("FadeToBlack")
	await SceneTransition.transition_in_middle
	get_tree().change_scene_to_file(scene_ruang_tamu)
