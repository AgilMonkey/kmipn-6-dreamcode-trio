extends Node2D

#signal minigame_selesai	

@onready var anim_minigame = $AnimationMinigame
@onready var sausage_1_return_pos: Vector2 = $Food/Sausage1Clip/Sausage1.global_position
@onready var sausage_2_return_pos: Vector2 = $Food/Sausage2Clip/Sausage2.global_position

func food_grabbed(object):
	object.get_parent().move_child(object, 0)
	object.clip_children = 0
	object.self_modulate = Color(1, 1, 1, 0)
	
	var parent = object.get_parent()
	var gramp = parent.get_parent()
	if gramp.name == 'Food':
		gramp.move_child(parent, gramp.get_child_count() - 1)
	else:
		var gregramp = gramp.get_parent()
		gregramp.move_child(gramp, gregramp.get_child_count() - 1)
		#print("parent exists (" + parent.name + "), "  + str(parent.get_child_count() - 1) + " child nodes exists")
		#print("gramp exists (" + gramp.name + "), "  + str(gramp.get_child_count() - 1) + " child nodes exists")
		#print("parent order before: " + str(parent.get_index()))
		#print("parent order after: " + str(parent.get_index()))

func food_release(object, return_pos):
	object.clip_children = 1
	object.self_modulate = Color(1, 1, 1, 0)
	
	object.set_linear_velocity(Vector2.ZERO)
	object.set_angular_velocity(0)
	
	var areas_return = $FoodReturnBoundary.get_overlapping_bodies()
	if len(areas_return) > 0:
		PhysicsServer2D.body_set_state(
		object,
		PhysicsServer2D.BODY_STATE_TRANSFORM,
		Transform2D.IDENTITY.translated(return_pos)
		)

func tween_tangan_ke_bawah(object: RigidBody2D):
	object.reparent($Tangan)
	var to = Vector2($Tangan.global_position.x, 1080)
	var tween = get_tree().create_tween()
	tween.tween_property($Tangan, "global_position", to, 2)

func _on_sausage_1_grabbed(object):
	food_grabbed(object)

func _on_sausage_1_released(object: RigidBody2D):
	food_release(object, sausage_1_return_pos)

func _on_sausage_2_grabbed(object):
	food_grabbed(object)

func _on_sausage_2_released(object):
	food_release(object, sausage_2_return_pos)
