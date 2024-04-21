extends CharacterBody2D


@export var speed = 300.0
var direction := Vector2.ZERO

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var interact_node = $InteractNode

func _ready():
	Dialogic.timeline_started.connect(dialogue_start)
	Dialogic.timeline_ended.connect(dialogue_stop)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	if direction:
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()


func _input(event):
	direction = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down")).normalized()
	
	if event.is_action_pressed("interact"):
		interact_node.interact()


func dialogue_start():
	set_process_input(false)
	direction = Vector2.ZERO
	velocity = Vector2.ZERO


func dialogue_stop():
	set_process_input(true)
