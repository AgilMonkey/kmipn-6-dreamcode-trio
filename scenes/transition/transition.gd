extends ColorRect


@onready var animation_player := $AnimationPlayer


func begin_animation():
	animation_player.play("begin")


func end_animation():
	animation_player.play("end")
