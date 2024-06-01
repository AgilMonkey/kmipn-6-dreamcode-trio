extends Node2D
class_name InteractIcon


func _ready():
	hide()
	var p = get_parent()
	if p is InteractArea:
		p.interact_icon = self


func interact():
	show()


func uninteract():
	hide()
