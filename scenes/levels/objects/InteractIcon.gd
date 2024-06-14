extends Node2D
class_name InteractIcon


var animation_pos := 0

@onready var animation_player := $AnimationPlayer


func _ready():
	hide()
	var p = get_parent()
	if p is InteractArea:
		p.interact_icon = self


func _process(delta):
	if animation_player.current_animation != "":
		animation_pos = animation_player.current_animation_position
	#print(animation_player.current_animation_position)


func interact():
	if animation_player.current_animation_position >= 0.25:
		return
	
	animation_player.play("start")


func uninteract():
	if animation_player.current_animation_position <= 0:
		return
	
	animation_player.play_backwards("start")
