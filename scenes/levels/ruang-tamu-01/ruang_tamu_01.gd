extends Node2D

@onready var scene_kamar_andika: PackedScene = preload("res://scenes/levels/kamar-andika-01/kamar_andika_01.tscn")
@onready var scene_dapur: PackedScene = preload("res://scenes/levels/dapur-01/dapur_01.tscn")
@onready var scene_luar_rumah_andika: PackedScene = preload("res://scenes/levels/luar-rumah-andika-01/LuarRumahAndika01.tscn")

@onready var ayah_andika_buble = $AyahAndika/AyahAndikaSpeechBuble 


func _ready():
	var from_pos: Node2D = get_node(LevelManager.from + "Pos")
	if from_pos != null:
		$Player.position = from_pos.position
		$PhantomCamera2D.position.x = $Player.position.x
	$Player.smoothing.teleport()
	
	# I'm to lazy so just set flip automically
	var win_size = DisplayServer.window_get_size() as Vector2
	$Player.flip_h(win_size.x/2 < $Player.global_position.x)
	
	# Quick dirty check to get out after eating
	if Dialogic.VAR.sudah_makan:
		$KeluarBelumMakan.process_mode = Node.PROCESS_MODE_DISABLED
		$Area2DToLuarRumahAndika.process_mode = Node.PROCESS_MODE_INHERIT


func _on_area_2d_to_kamar_andika_on_change_scene():
	LevelManager.from = "RuangTamu"
	$Player.set_process_input(false)
	$Player.direction = Vector2.ZERO
	LevelManager.change_scene_with_transition(scene_kamar_andika)


func _on_area_2d_to_dapur_on_change_scene(body):
	LevelManager.from = "RuangTamu"
	$Player.set_process_input(false)
	$Player.direction = Vector2.ZERO
	LevelManager.change_scene_with_transition(scene_dapur)


func _on_area_2d_to_luar_rumah_andika_change_scene():
	LevelManager.from = "RuangTamu"
	$Player.set_process_input(false)
	$Player.direction = Vector2.ZERO
	LevelManager.change_scene_with_transition(scene_luar_rumah_andika)


func _on_interact_dialogue_dialogue_started(layout):
	layout.register_character(load("res://dialogic-stuff/characters/Ayah.dch"), ayah_andika_buble)
