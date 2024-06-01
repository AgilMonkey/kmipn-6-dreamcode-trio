extends Control


func _on_game_baru_button_button_down():
	LevelManager.change_scene_with_transition("res://scenes/levels/scene-intro/scene_intro.tscn")


func _on_keluar_button_button_down():
	get_tree().quit()
