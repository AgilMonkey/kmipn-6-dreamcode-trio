extends Node2D

var player:
	get:
		return get_tree().get_first_node_in_group("player")

var active_areas: Array[InteractArea] = []
var can_interact = true


func register_area(area: InteractArea):
	active_areas.push_back(area)
	
	active_areas.sort_custom(_sort_by_distance_to_player)
	active_areas[0].show_interact_icon()


func unregister_area(area: InteractArea):
	area.hide_interact_icon()
	active_areas.erase(area)


func _process(delta):
	if active_areas.size() > 0 and can_interact:
		active_areas.sort_custom(_sort_by_distance_to_player)


func _sort_by_distance_to_player(area1, area2):
	if not player:
		return
	
	var area1_to_player = player.global_position.distance_to(area1.global_position)
	var area2_to_player = player.global_position.distance_to(area2.global_position)
	
	return


func _input(event):
	if Input.is_action_just_pressed("interact") and can_interact:
		if active_areas.size() > 0:
			can_interact = false
			
			active_areas[0].hide_interact_icon()
			await active_areas[0].interact
			
			can_interact = true
