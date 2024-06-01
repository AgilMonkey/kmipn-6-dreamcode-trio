extends CharacterBody2D

@export var speed: int = 300

var direction: Vector2
var grabbed_obj: RigidBody2D

@onready var tangan_sprite: Sprite2D = $HandSprite
@onready var press_area := $PressArea

@onready var hand_spirte_release = preload("res://assets/2.1 - Minigame mengisi token listrik/tangan1.svg")
@onready var hand_sprite_press = preload("res://assets/2.1 - Minigame mengisi token listrik/tangan2.svg")

func _input(event):
	direction = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down")).normalized()
	
	if event.is_action_pressed("interact"):
		tangan_sprite.texture = hand_sprite_press
		press_area.grab()
	elif event.is_action_released("interact"):
		tangan_sprite.texture = hand_spirte_release
		press_area.release()


func _physics_process(delta):
	# hand movement
	velocity = direction * speed
	
	# Grabbed obj logic
	if grabbed_obj:
		grabbed_obj.global_position = global_position
	
	move_and_slide()

func set_input(enable):
	set_process_input(enable)
