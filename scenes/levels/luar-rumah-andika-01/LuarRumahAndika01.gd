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


func _on_interact_minigame_isi_token_listrk_interacted(node):
	$Player.set_process_input(false)
	$Player.direction = Vector2.ZERO
	$MinigameStuff.show()
	%"minigame-mengisi-token-listrik".process_mode = Node.PROCESS_MODE_INHERIT
	%"minigame-mengisi-token-listrik".show()
	await %"minigame-mengisi-token-listrik".minigame_selesai
	$Player.set_process_input(true)
	$MinigameStuff.visible = false
	%"minigame-mengisi-token-listrik".process_mode = Node.PROCESS_MODE_DISABLED
	%"minigame-mengisi-token-listrik".hide()
	Dialogic.VAR.sudah_isi_token = true
	node.stop_minigame.emit()


func _on_interact_dialogue_dialogue_started(layout):
		layout.register_character(load("res://dialogic-stuff/characters/PakRt.dch"), $KarakterPakRt/PakRtBuble)


func _on_minigame_kotak_start_minigame(node):
	$Player.set_process_input(false)
	$Player.direction = Vector2.ZERO
	$MinigameStuff.show()
	%"minigame_mencari_barang".process_mode = Node.PROCESS_MODE_INHERIT
	%"minigame_mencari_barang".show()
	await %"minigame_mencari_barang".minigame_selesai
	$Player.set_process_input(true)
	$MinigameStuff.visible = false
	%"minigame_mencari_barang".process_mode = Node.PROCESS_MODE_DISABLED
	%"minigame_mencari_barang".hide()
	Dialogic.VAR.sudah_isi_token = true
	node.stop_minigame.emit()
