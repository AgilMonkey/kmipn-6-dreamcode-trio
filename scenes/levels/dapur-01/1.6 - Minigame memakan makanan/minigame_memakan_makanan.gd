extends Node2D

signal minigame_selesai

@onready var anim_minigame = $AnimationMinigame

# Dictionary to store initial positions of 'Food' node children
var initial_positions := {}

var food_count = 9

var first_grab_pressed = false
var first_move_pressed = false

func _input(event):
	if event is InputEventKey and event.is_pressed() and not event.is_echo():
		if not first_move_pressed:
			handle_first_key_press(event)
			#else:
				#anim_minigame.play_backwards("tutorial_movement")
				#anim_minigame.queue("grabbing_tutorial")
		if not first_grab_pressed:
			#anim_minigame.play_backwards("grabbing_tutorial")
			handle_first_key_press(event)

func handle_first_key_press(event):
	#match event.scancode:
		#KEY_A:
			#print("You pressed A!")
		#KEY_B:
			#print("You pressed B!")
			
	if event.keycode == KEY_LEFT or event.keycode == KEY_RIGHT or event.keycode == KEY_UP or event.keycode == KEY_DOWN:
		first_move_pressed = true
		if anim_minigame.is_playing():
			await anim_minigame.animation_finished
			anim_minigame.play_backwards("tutorial_movement")
			anim_minigame.queue("grabbing_tutorial")
	elif event.keycode == KEY_Z:
		anim_minigame.play_backwards("grabbing_tutorial")

func _ready():
	# Get the 'Food' node
	var food = $Food
	# Iterate over its children
	for child in food.get_children():
		# Store initial positions of 'Food' node children
		for grandchild in child.get_children():
			initial_positions[grandchild.name] = grandchild.global_position

			# Connect signals for child nodes of 'Food' node children
			connect_child_signals(grandchild)

	# Connect the animation_finished signal
	anim_minigame.connect("animation_finished", Callable(self, "_on_animation_finished"))

func connect_child_signals(grandchild):
	if grandchild.has_signal("grabbed"):
		grandchild.connect("grabbed", Callable(self, "_on_food_child_grabbed").bind(grandchild))
	if grandchild.has_signal("released"):
		grandchild.connect("released", Callable(self, "_on_food_child_released").bind(grandchild))

# Handler function for 'grabbed' signal emitted by child nodes
func _on_food_child_grabbed(child):
	food_grabbed(child)

# Handler function for 'released' signal emitted by child nodes
func _on_food_child_released(child):
	var return_pos = initial_positions[child.name]
	food_release(child, return_pos)

func selesaikan_game():
	minigame_selesai.emit()
	print("Minigame selesai")

func food_grabbed(object):
	object.get_parent().move_child(object, 0)
	object.clip_children = 0
	object.self_modulate = Color(1, 1, 1, 0)
	
	var parent = object.get_parent()
	var gramp = parent.get_parent()
	if gramp.name == 'Food':
		gramp.move_child(parent, gramp.get_child_count() - 1)

func food_release(object, return_pos):
	object.clip_children = 1
	object.self_modulate = Color(1, 1, 1, 1)
	
	object.set_linear_velocity(Vector2.ZERO)
	object.set_angular_velocity(0)
	
	var areas_return = $FoodReturnBoundary.get_overlapping_bodies()
	if len(areas_return) > 0:
		PhysicsServer2D.body_set_state(
		object,
		PhysicsServer2D.BODY_STATE_TRANSFORM,
		Transform2D.IDENTITY.translated(return_pos)
		)

	var areas_accept = $EatZone.get_overlapping_bodies()
	if len(areas_accept) > 0:
		print(areas_accept)
		tween_tangan_ke_bawah(object)
		object.clip_children = 0
		object.self_modulate = Color(1, 1, 1, 0)
		print("play 'get_food'")

func tween_tangan_ke_bawah(object: RigidBody2D):
	anim_minigame.play("get_food")
	object.reparent($Tangan)
	var to = Vector2($Tangan.global_position.x, 1080)
	var tween = get_tree().create_tween()
	tween.tween_property($Tangan, "global_position", to, 2)

# Handle the animation_finished signal	
func _on_animation_finished(anim_name):
	if anim_name == "get_food":
		print($Tangan.get_children())
		$Tangan.get_child(-1).queue_free()
		anim_minigame.play("start_game")
	
	# animasi tutorial
	elif anim_name == "actual_start_game":
		anim_minigame.play("tutorial_movement")

func _on_food_grabbed(object):
	food_grabbed(object)

func _on_food_released(object: RigidBody2D):
	food_release(object, initial_positions[object.name])	


