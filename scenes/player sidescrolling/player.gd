extends CharacterBody2D


@export var speed = 300.0
var direction := Vector2.ZERO

var is_minigame := false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var interact_node = $InteractNode
@onready var sprite = %GfxPlayer
@onready var smoothing := $Smoothing2D

func _ready():
	Dialogic.timeline_started.connect(dialogue_start)
	Dialogic.timeline_ended.connect(dialogue_stop)
	
	smoothing.teleport()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	if direction:
		velocity.x = direction.x * speed
		sprite.scale.x = -1 if direction.x <= 0 else 1
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()


func _input(event):
	if is_minigame:
		return
	
	direction.x = Input.get_axis("move_left", "move_right")
	
	if event.is_action_pressed("interact"):
		interact_node.interact()


func dialogue_start():
	set_process_input(false)
	direction = Vector2.ZERO
	velocity = Vector2.ZERO


func dialogue_stop():
	set_process_input(true)


func _on_minigame_started():
	is_minigame = true


func _on_minigame_quitted():
	is_minigame = false
