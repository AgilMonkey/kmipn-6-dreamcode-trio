extends Area2D

var grabbed_obj: Node2D 
var grabbed_obj_gravity_scale: float
var rel_pos_grab_obj: Vector2

@export var tangan_character: CharacterBody2D

func press():
	#print("press")
	var areas = get_overlapping_areas()
	if len(areas) > 0:
		var area = get_overlapping_areas()[0]	
		#print("area:" + str(area.get_parent().name))
		if area.has_method("button_pressed"):
			area.button_pressed()

func release():
	#print("release")
	pass

#func _on_area_entered(area):
	#print("PressArea entered: " + str(area))
	#if area.has_method("button_pressed"):
		#area.button_pressed()
