extends RigidBody2D

@export_flags_2d_physics var grabbed_col_mask = 0
var normal_col_mask = 0b00000000_00000000_00000000_00011001

@onready var col_shape := $CollisionShape2D
@onready var area_check: Area2D = $AreaCheck

signal grabbed(object: RigidBody2D)
signal released(object: RigidBody2D)

func _ready():
	normal_col_mask = collision_mask

func grab(grabber: Node2D):
	grabbed.emit(self)

func release(grabber: Node2D):
	released.emit(self)

func _on_grabbed(object):
	collision_mask = grabbed_col_mask

func _on_released(object):
	collision_mask = normal_col_mask
