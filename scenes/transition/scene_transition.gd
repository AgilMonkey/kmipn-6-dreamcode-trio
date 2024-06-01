extends Control


var current_transition

signal transition_started
signal transition_in_middle
signal transition_ended


func start_transition(trans_name: String):
	current_transition = find_child(trans_name)
	current_transition.begin_animation()
	transition_started.emit()


func transition_middle():
	await get_tree().create_timer(1.0).timeout
	current_transition.end_animation()

func  end_transition():
	transition_ended.emit()
