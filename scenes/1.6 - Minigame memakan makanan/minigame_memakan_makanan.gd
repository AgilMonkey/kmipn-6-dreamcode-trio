extends Node2D

#signal minigame_selesai

@onready var anim_minigame = $AnimationMinigame

# Lokasi setiap makanan
@onready var sausage_1_return_pos: Vector2 = $Food/Sausage1Clip/Sausage1.global_position
@onready var sausage_2_return_pos: Vector2 = $Food/Sausage2Clip/Sausage2.global_position
@onready var egg_1_return_pos: Vector2 = $Food/Egg1Clip/Egg1.global_position
@onready var egg_2_return_pos: Vector2 = $Food/Egg2Clip/Egg2.global_position
@onready var rice_1_return_pos: Vector2 = $Food/Rice1Clip/Rice1.global_position
@onready var rice_2_return_pos: Vector2 = $Food/Rice2Clip/Rice2.global_position
@onready var rice_3_return_pos: Vector2 = $Food/Rice3Clip/Rice3.global_position
@onready var vegetable_1_return_pos: Vector2 = $Food/Vegetable1Clip/Vegetable1.global_position
@onready var vegetable_2_return_pos: Vector2 = $Food/Vegetable2Clip/Vegetable2.global_position

#func selesaikan_game():
	#minigame_selesai.emit()
	#print("Minigame selesai")
	
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

func _on_sausage_1_grabbed(object):
	food_grabbed(object)

func _on_sausage_1_released(object: RigidBody2D):
	food_release(object, sausage_1_return_pos)

func _on_sausage_2_grabbed(object):
	food_grabbed(object)

func _on_sausage_2_released(object):
	food_release(object, sausage_2_return_pos)

func _on_egg_2_grabbed(object):
	food_grabbed(object)

func _on_egg_2_released(object):
	food_release(object, egg_2_return_pos)

func _on_egg_1_grabbed(object):
	food_grabbed(object)

func _on_egg_1_released(object):
	food_release(object, egg_1_return_pos)

func _on_rice_3_grabbed(object):
	food_grabbed(object)

func _on_rice_3_released(object):
	food_release(object, rice_1_return_pos)

func _on_rice_2_grabbed(object):
	food_grabbed(object)

func _on_rice_2_released(object):
	food_release(object, rice_2_return_pos)

func _on_rice_1_grabbed(object):
	food_grabbed(object)

func _on_rice_1_released(object):
	food_release(object, rice_3_return_pos)

func _on_vegetable_1_grabbed(object):
	food_grabbed(object)

func _on_vegetable_1_released(object):
	food_release(object, vegetable_1_return_pos)

func _on_vegetable_2_grabbed(object):
	food_grabbed(object)

func _on_vegetable_2_released(object):
	food_release(object, vegetable_2_return_pos)
