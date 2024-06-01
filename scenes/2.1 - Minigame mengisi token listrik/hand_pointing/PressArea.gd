extends Area2D

var grabbed_obj: Node2D 
var grabbed_obj_gravity_scale: float
var rel_pos_grab_obj: Vector2

@export var tangan_character: CharacterBody2D

func grab():
	var bodies = get_overlapping_bodies()
	print("grab")

func release():
	print("release")

func _on_body_exited(body):
	if body == grabbed_obj:
		release()
