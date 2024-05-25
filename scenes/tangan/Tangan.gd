extends CharacterBody2D

@export var speed: int = 300

var direction: Vector2
var grabbed_obj: RigidBody2D

@onready var tangan_sprite: Sprite2D = $TanganSprite
@onready var grab_area := $GrabArea

@onready var hand_sprite_unhold = preload("res://assets/3.8 - Minigame vending machine/tangan1.svg")
@onready var hand_sprite_hold = preload("res://assets/3.8 - Minigame vending machine/tangan2.svg")

func _input(event):
	direction = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down")).normalized()
	
	if event.is_action_pressed("interact"):
		tangan_sprite.texture = hand_sprite_hold
		grab_area.grab()
	elif event.is_action_released("interact"):
		tangan_sprite.texture = hand_sprite_unhold
		grab_area.release()


func _physics_process(delta):
	# hand movement
	velocity = direction * speed
	
	# Grabbed obj logic
	if grabbed_obj:
		grabbed_obj.global_position = global_position
	
	move_and_slide()
