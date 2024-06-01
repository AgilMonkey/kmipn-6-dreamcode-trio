extends Node2D


var scene_ruang_tamu: String = "res://scenes/levels/ruang-tamu-01/ruang_tamu_01.tscn"


# Called when the node enters the scene tree for the first time.
func _ready():
	var from_pos: Node2D = get_node(LevelManager.from + "Pos")
	if from_pos != null:
		$Player.position = from_pos.position
		$Player.smoothing.teleport()


func _on_area_2d_to_ruang_tamu_on_change_scene():
	LevelManager.from = "LuarRumahAndika"
	get_tree().change_scene_to_file(scene_ruang_tamu)
