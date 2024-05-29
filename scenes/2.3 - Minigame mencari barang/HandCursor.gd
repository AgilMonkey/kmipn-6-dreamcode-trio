extends Node2D

@export var cursor_speed: int = 500 
var input_dir: Vector2

var WIDTH: int
var HEIGHT: int

func _ready():
	var rect_size = get_viewport().get_visible_rect().size
	WIDTH = rect_size.x
	HEIGHT = rect_size.y


func _input(event):
	input_dir = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down"))
	input_dir = input_dir.normalized()


func _process(delta):
	position += input_dir * cursor_speed * delta
	
	position.x = clamp(position.x, 0, WIDTH)
	position.y = clamp(position.y, 0, HEIGHT)
