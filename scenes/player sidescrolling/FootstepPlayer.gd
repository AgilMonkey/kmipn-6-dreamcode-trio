extends AudioStreamPlayer


@export var footsteps: Array[AudioStream]


func play_random_footstep():
	stream = footsteps.pick_random()
	play()
