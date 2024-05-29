extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#var screen_size = get_viewport_rect().size
	#
	## Set the position to the center of the screen
	#position = screen_size / 2
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_objective_pressed():
	print("You found the key!")
	#key_found()
	#pass


func key_found():
	var t = 0.0
	t += get_process_delta_time() * 0.4

	$Sprite2D.position = Vector2(500, 100).lerp(Vector2(100, 500), t)
