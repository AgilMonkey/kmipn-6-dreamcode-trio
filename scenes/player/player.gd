extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -600.0

var direction: Vector2

@onready var interact_node = $InteractNode

func _ready():
	Dialogic.timeline_started.connect(dialogue_start)
	Dialogic.timeline_ended.connect(dialogue_stop)

func _physics_process(delta):
	if direction:
		velocity = direction * SPEED
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()


func _input(event):
	direction = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down"))
	
	if event.is_action_pressed("interact"):
		interact_node.interact()


func dialogue_start():
	set_process_input(false)

func dialogue_stop():
	set_process_input(true)
