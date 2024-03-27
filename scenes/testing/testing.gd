extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var style: DialogicStyle = load("res://dialogic-stuff/default_style.tres")
	style.prepare()
