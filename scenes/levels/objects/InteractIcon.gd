extends Node2D
class_name InteractIcon


@onready var animation_player := $AnimationPlayer


func _ready():
	hide()
	var p = get_parent()
	if p is InteractArea:
		p.interact_icon = self


func interact():
	animation_player.play("start")


func uninteract():
	animation_player.play("end")
