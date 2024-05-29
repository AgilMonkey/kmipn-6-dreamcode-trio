extends Node2D

var scene_kamar_andika: String = "res://scenes/levels/kamar-andika-01/kamar_andika_01.tscn"


func _on_area_2d_to_kamar_andika_on_change_scene():
	get_tree().change_scene_to_file(scene_kamar_andika)

