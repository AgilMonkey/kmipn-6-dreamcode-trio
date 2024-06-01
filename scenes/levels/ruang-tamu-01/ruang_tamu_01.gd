extends Node2D

var scene_kamar_andika: String = "res://scenes/levels/kamar-andika-01/kamar_andika_01.tscn"
var scene_dapur: String = "res://scenes/levels/dapur-01/dapur_01.tscn"
var scene_luar_rumah_andika: String = "res://scenes/levels/luar-rumah-andika-01/LuarRumahAndika01.tscn"


func _ready():
	var from_pos: Node2D = get_node(LevelManager.from + "Pos")
	if from_pos != null:
		$Player.position = from_pos.position
		$PhantomCamera2D.position.x = $Player.position.x
	$Player.smoothing.teleport()


func _on_area_2d_to_kamar_andika_on_change_scene():
	LevelManager.from = "RuangTamu"
	$Player.set_process_input(false)
	$Player.direction = Vector2.ZERO
	SceneTransition.start_transition("FadeToBlack")
	await SceneTransition.transition_in_middle
	get_tree().change_scene_to_file(scene_kamar_andika)


func _on_area_2d_to_dapur_on_change_scene():
	LevelManager.from = "RuangTamu"
	$Player.set_process_input(false)
	$Player.direction = Vector2.ZERO
	SceneTransition.start_transition("FadeToBlack")
	await SceneTransition.transition_in_middle
	get_tree().change_scene_to_file(scene_dapur)


func _on_area_2d_to_luar_rumah_andika_body_entered(body):
	LevelManager.from = "RuangTamu"
	$Player.set_process_input(false)
	$Player.direction = Vector2.ZERO
	SceneTransition.start_transition("FadeToBlack")
	await SceneTransition.transition_in_middle
	get_tree().change_scene_to_file(scene_luar_rumah_andika)
