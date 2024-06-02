extends Node2D


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


func _on_area_2d_ke_rumah_andika_body_entered(body):
	LevelManager.from = "LuarRumah2"
	$Player.set_process_input(false)
	$Player.direction = Vector2.ZERO
	LevelManager.change_scene_with_transition("res://scenes/levels/luar-rumah-andika-01/LuarRumahAndika01.tscn")



func _on_area_2d_ke_sekolah_body_entered(body):
	LevelManager.from = "LuarRumah2"
	$Player.set_process_input(false)
	$Player.direction = Vector2.ZERO
	LevelManager.change_scene_with_transition("res://scenes/levels/di-sekolah-01/di_sekolah.tscn")
