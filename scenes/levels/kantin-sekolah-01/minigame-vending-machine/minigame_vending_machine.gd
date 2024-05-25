extends Node2D


func _on_botol_grabbed(object):
	$BotolClip.clip_children = 0
	$BotolClip.self_modulate = Color(1, 1, 1, 0) 


func _on_botol_released(object):
	$BotolClip.clip_children = 1
	$BotolClip.self_modulate = Color(1, 1, 1, 1) 
