extends Node2D

var botol_return_pos: Vector2 = Vector2(709.7606, 428.6981)

signal minigame_selesai

@onready var anim_minigame = $AnimationMinigame


func selesaikan_game():
	minigame_selesai.emit()
	print("Minigame selesai")


func _on_botol_grabbed(object):
	$BotolClip.clip_children = 0
	$BotolClip.self_modulate = Color(1, 1, 1, 0)


func _on_botol_released(object: RigidBody2D):
	$BotolClip.clip_children = 1
	$BotolClip.self_modulate = Color(1, 1, 1, 1)
	
	# return botol
	var areas_return = $BotolReturnBoundary.get_overlapping_bodies()
	if len(areas_return) > 0:
		PhysicsServer2D.body_set_state(
		object,
		PhysicsServer2D.BODY_STATE_TRANSFORM,
		Transform2D.IDENTITY.translated(botol_return_pos)
		)

	# Accept botol
	var areas_accept = $BotolAccept.get_overlapping_bodies()
	if len(areas_accept) > 0:
		$BotolClip.clip_children = 0
		$BotolClip.self_modulate = Color(1, 1, 1, 0)
		anim_minigame.play("get_kaleng")

func tween_tangan_ke_bawah():
	$BotolClip/Botol.reparent($Tangan)
	var to = Vector2($Tangan.global_position.x, 1080)
	var tween = get_tree().create_tween()
	tween.tween_property($Tangan, "global_position", to, 2)

