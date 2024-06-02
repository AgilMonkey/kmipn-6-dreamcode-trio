extends Node2D

var scene_ruang_tamu: String = "res://scenes/levels/ruang-tamu-01/ruang_tamu_01.tscn"


func _ready():
	var from_pos: Node2D = get_node(LevelManager.from + "Pos")
	if from_pos != null:
		$Player.position = from_pos.position
		$Player.smoothing.teleport()
	
	var win_size = DisplayServer.window_get_size() as Vector2
	$Player.flip_h(win_size.x/2 < $Player.global_position.x)
	
	if Dialogic.VAR.is_new_game:
		$Player.set_process_input(false)
		await get_tree().create_timer(1.0).timeout
		await new_game_dialogue()
		$Tutorial/AnimationPlayer.play("start_tutorial")


func new_game_dialogue():
	var layout = Dialogic.start("res://scenes/levels/kamar-andika-01/new_game_dialogue.dtl")
	layout.register_character(load("res://dialogic-stuff/characters/Andika.dch"), $Player/TextBubblePivot)
	await Dialogic.timeline_ended
	Dialogic.VAR.is_new_game = false


func _on_area_2d_ke_ruang_tamu_body_entered(body):
	LevelManager.from = "KamarAndika"
	SceneTransition.start_transition("FadeToBlack")
	$Player.set_process_input(false)
	$Player.direction = Vector2.ZERO
	await SceneTransition.transition_in_middle
	get_tree().change_scene_to_file(scene_ruang_tamu)
