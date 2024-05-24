extends CharacterBody2D


@export var SPEED = 250.0

var direction: Vector2

@onready var interact_pivot = $InteractPivot
@onready var interact_node = $InteractPivot/InteractNode
@onready var PlayerSprite: AnimatedSprite2D = $PlayerSprite


func _ready():
	Dialogic.timeline_started.connect(dialogue_start)
	Dialogic.timeline_ended.connect(dialogue_stop)


func _physics_process(delta):
	if direction:
		velocity = direction * SPEED
		
		# Putar InteractPivot sesuai arah player
		var ang = direction.angle() - PI/2
		interact_pivot.rotation = ang
		
		# Ganti animasinya
		if direction.y > 0:
			PlayerSprite.play("idle_down")
		elif direction.y < 0:
			PlayerSprite.play("idle_up")
		elif direction.x > 0:
			PlayerSprite.flip_h = false
			PlayerSprite.play("idle_side")
		elif direction.x < 0:
			PlayerSprite.flip_h = true
			PlayerSprite.play("idle_side")
	else:
		velocity = Vector2.ZERO
	
	
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
