extends Area2D

var grabbed_obj: Node2D  # Bisa Rigidbody yang ada fisikanya atau item quest
var grabbed_obj_gravity_scale: float
var rel_pos_grab_obj: Vector2

@export var tangan_character: CharacterBody2D

func grab():
	var bodies = get_overlapping_bodies()
	if len(bodies) > 0:
		var body: RigidBody2D = bodies[0]
		grabbed_obj_gravity_scale = body.gravity_scale
		body.gravity_scale = 0
		grabbed_obj = body
		grabbed_obj.grab(tangan_character)
		rel_pos_grab_obj = body.global_position - global_position


func release():
	if grabbed_obj:
		grabbed_obj.gravity_scale = grabbed_obj_gravity_scale
		grabbed_obj.release(tangan_character)
		grabbed_obj = null


func _physics_process(delta):
	if grabbed_obj is RigidBody2D:
		#var next_pos = global_position + rel_pos_grab_obj
		grabbed_obj.linear_velocity = tangan_character.velocity


func _on_body_exited(body):
	if body == grabbed_obj:
		release()
