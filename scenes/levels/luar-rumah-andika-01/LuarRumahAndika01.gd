extends Node2D


var scene_ruang_tamu: String = "res://scenes/levels/ruang-tamu-01/ruang_tamu_01.tscn"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	var from_pos: Node2D
	var from_nodes = get_tree().get_nodes_in_group("from")
	
	for node in from_nodes:
		if node.name == LevelManager.from + "Pos":
			from_pos = node
			break
	
	if from_pos != null:
		$Player.global_position = from_pos.global_position
		$Player.smoothing.teleport()


func _on_area_2d_to_ruang_tamu_on_change_scene():
	LevelManager.from = "LuarRumahAndika"
	$Player.set_process_input(false)
	$Player.direction = Vector2.ZERO
	SceneTransition.start_transition("FadeToBlack")
	await SceneTransition.transition_in_middle
	get_tree().change_scene_to_file(scene_ruang_tamu)
