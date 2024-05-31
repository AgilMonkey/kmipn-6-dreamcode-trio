extends Node2D

#signal minigame_selesai

@onready var anim_minigame = $AnimationMinigame
@onready var sausage_1_return_pos: Vector2 = $Food/Sausage1Clip/Sausage1.global_position
@onready var sausage_2_return_pos: Vector2 = $Food/Sausage1Clip/Sausage1.global_position

#func selesaikan_game():
	#minigame_selesai.emit()
	#print("Minigame selesai")

func _on_sausage_1_grabbed(object):
	$Food/Sausage1Clip.clip_children = 0
	$Food/Sausage1Clip.self_modulate = Color(1, 1, 1, 0)

func _on_sausage_1_released(object: RigidBody2D):
	$Food/Sausage1Clip.clip_children = 1
	$Food/Sausage1Clip.self_modulate = Color(1, 1, 1, 0)
	
	object.set_linear_velocity(Vector2.ZERO)
	object.set_angular_velocity(0)
	
	var areas_return = $FoodReturnBoundary.get_overlapping_bodies()
	if len(areas_return) > 0:
		PhysicsServer2D.body_set_state(
		object,
		PhysicsServer2D.BODY_STATE_TRANSFORM,
		Transform2D.IDENTITY.translated(sausage_1_return_pos)
		)


func _on_sausage_2_grabbed(object):
	food_grabbed(object)
	#$Food/Sausage2Clip.clip_children = 0
	#$Food/Sausage2Clip.self_modulate = Color(1, 1, 1, 0)

func _on_sausage_2_released(object):
	food_release(object, sausage_2_return_pos)
	#$Food/Sausage2Clip.clip_children = 1
	#$Food/Sausage2Clip.self_modulate = Color(1, 1, 1, 0)
	#
	#object.set_linear_velocity(Vector2.ZERO)
	#object.set_angular_velocity(0)
	#
	#var areas_return = $FoodReturnBoundary.get_overlapping_bodies()
	#if len(areas_return) > 0:
		#PhysicsServer2D.body_set_state(
		#object,
		#PhysicsServer2D.BODY_STATE_TRANSFORM,
		#Transform2D.IDENTITY.translated(sausage_2_return_pos)
		#)

func food_grabbed(object):
	object.clip_children = 0
	object.self_modulate = Color(1, 1, 1, 0)

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
