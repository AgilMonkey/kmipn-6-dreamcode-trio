extends Node2D


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
	
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _on_dialogic_signal(argument:String):
	if argument == "bayu_ended":
		LevelManager.change_scene_with_transition("res://scenes/levels/ruang-kelas-andika-01/ruang_kelas_andika.tscn")
		$Teman.process_mode = Node.PROCESS_MODE_DISABLED


func _on_area_2d_ke_luar_rumah_2_body_entered(body):
	LevelManager.from = "Sekolah"
	$Player.set_process_input(false)
	$Player.direction = Vector2.ZERO
	LevelManager.change_scene_with_transition("res://scenes/levels/luar-rumah-andika-02/luar_rumah_andika_02.tscn")


func _on_interact_dialogue_dialogue_started(layout):
	layout.register_character(load("res://dialogic-stuff/characters/Bayu.dch"), $Teman/TemanSpeechPivot)
