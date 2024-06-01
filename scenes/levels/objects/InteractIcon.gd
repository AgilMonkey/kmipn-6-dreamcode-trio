extends Node2D
class_name InteractIcon


@onready var animation_player := $AnimationPlayer


func _ready():
	hide()
	var p = get_parent()
	if p is InteractArea:
		p.interact_icon = self



func interact():
	if animation_player.current_animation_position == animation_player.current_animation_length:
		return
	
	animation_player.play("start")


func uninteract():
	if animation_player.current_animation_position > 0:
		animation_player.play_backwards("start")
