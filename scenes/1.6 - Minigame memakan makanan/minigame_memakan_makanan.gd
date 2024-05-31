extends Node2D

var initial_positions := {}

func _ready():
	var food = $Food
	for child in food.get_children():
		initial_positions[child.name] = child.global_position

		#Note: child di sini refer ke node yang namanya *Clip (e.g. Sausage1Clip),
		#Sedangkan actual scene Foodnya itu yg childnya si node *Clip.
		connect_signals(child)

func connect_signals(child):
	print(child.name)
	#printf("child has " . child.get_)
	if child.has_signal("grabbed"):
		print("child has grabbed() signal")
		child.connect("grabbed", self, "_on_food_grabbed")
	else:
		print("child didn't have grabbed() signal")
		
	if child.has_signal("released"):
		print("child has released() signal")
		child.connect("released", self, "_on_food_released")
	else:
		print("child didn't have released() signal")

func _on_food_grabbed(object):
	print("_on_food_grabbed()")
	food_grabbed(object)

func _on_food_released(object):
	print("_on_food_released()")
	var return_pos = initial_positions[object.name]
	food_release(object, return_pos)

func food_grabbed(object):
	print("food_grabbed()")
	object.get_parent().move_child(object, 0)
	object.clip_children = 0
	object.self_modulate = Color(1, 1, 1, 0)
	
	var parent = object.get_parent()
	var gramp = parent.get_parent()
	if gramp.name == 'Food':
		gramp.move_child(parent, gramp.get_child_count() - 1)
	else:
		var gregramp = gramp.get_parent()
		gregramp.move_child(gramp, gregramp.get_child_count() - 1)

func food_release(object, return_pos):
	print("food_release()")
	object.clip_children = 1
	object.self_modulate = Color(1, 1, 1, 0)
	
	object.set_linear_velocity(Vector2.ZERO)
	object.set_angular_velocity(0)
	
	var areas_return = $FoodReturnBoundary.get_overlapping_bodies()
	if len(areas_return) > 0:
		PhysicsServer2D.body_set_state(
		object,
		PhysicsServer2D.BODY_STATE_TRANSFORM,
		Transform2D.IDENTITY.translated(return_pos)
		)
