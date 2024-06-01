extends Control


func _on_game_baru_button_button_down():
	LevelManager.change_scene_with_transition("res://scenes/levels/scene-intro/scene_intro.tscn")
