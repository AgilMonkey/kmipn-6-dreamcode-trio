extends Node2D

@export var scene_ruang_tamu: PackedScene 


func _on_area_2d_ke_ruang_tamu_body_entered(body):
	get_tree().change_scene_to_packed(scene_ruang_tamu)
