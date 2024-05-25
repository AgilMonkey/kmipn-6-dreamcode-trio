extends Area2D

var grabbed_obj: Node2D  # Bisa Rigidbody yang ada fisikanya atau item quest
var rel_pos_grab_obj: Vector2

func grab():
	var bodies = get_overlapping_bodies()
	if len(bodies) > 0:
		grabbed_obj = bodies[0]
		rel_pos_grab_obj = grabbed_obj.global_position - global_position


func release():
	if grabbed_obj:
		grabbed_obj = null


func _physics_process(delta):
	if grabbed_obj:
		grabbed_obj.global_position = global_position + rel_pos_grab_obj
