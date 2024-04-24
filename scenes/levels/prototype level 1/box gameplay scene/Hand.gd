extends CharacterBody2D


@export var speed := 300

var direction: Vector2

var hold_obj: RigidBody2D
var hold_obj_l_damp: float
var hold_obj_mass: float

@onready var hold_area = $HoldArea


func _physics_process(delta):
	if hold_obj:
		hold_obj.linear_velocity = direction * speed
	
	# hand movement
	velocity = direction * speed
	
	move_and_slide()


func _input(event):
	direction = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down")).normalized()
	
	if event.is_action_pressed("interact"):
		var bodies = hold_area.get_overlapping_bodies()
		for b in bodies:
			if b is RigidBody2D:
				hold_obj = b
				hold_obj_l_damp = hold_obj.linear_damp
				hold_obj.linear_damp = 0
				hold_obj_mass = hold_obj.mass
				hold_obj.mass = 2
				break
	elif event.is_action_released("interact"):
		if hold_obj: 
			hold_obj.linear_damp = hold_obj_l_damp
			hold_obj.mass = hold_obj_mass
		hold_obj = null


func _on_hold_area_body_exited(body):
	if body == hold_obj:
		hold_obj.linear_damp = hold_obj_l_damp
		hold_obj.mass = hold_obj_mass
		hold_obj = null
