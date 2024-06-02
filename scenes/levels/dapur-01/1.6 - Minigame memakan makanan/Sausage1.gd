extends Node2D

@onready var col_shape := $CollisionShape2D
@onready var area_check: Area2D = $AreaCheck

signal grabbed(object: RigidBody2D)
signal released(object: RigidBody2D)

#func _ready():
	#normal_col_mask = collision_mask

func grab(grabber: Node2D):
	grabbed.emit(self)

func release(grabber: Node2D):
	released.emit(self)
