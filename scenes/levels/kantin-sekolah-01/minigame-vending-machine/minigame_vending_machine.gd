extends Node2D

var botol_return_pos: Vector2 = Vector2(709.7606, 428.6981)

func _on_botol_grabbed(object):
	$BotolClip.clip_children = 0
	$BotolClip.self_modulate = Color(1, 1, 1, 0)


func _on_botol_released(object: RigidBody2D):
	$BotolClip.clip_children = 1
	$BotolClip.self_modulate = Color(1, 1, 1, 1)
	var areas = $BotolReturnBoundary.get_overlapping_bodies()
	if len(areas) > 0:
		PhysicsServer2D.body_set_state(
		object,
		PhysicsServer2D.BODY_STATE_TRANSFORM,
		Transform2D.IDENTITY.translated(botol_return_pos)
		)
