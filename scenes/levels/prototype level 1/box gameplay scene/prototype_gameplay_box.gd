extends Node2D


signal _on_started
signal _on_quitted

# Called when the node enters the scene tree for the first time.
func _init():
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _on_dialogic_signal(event:String):
	if event == "_play_box_minigame":
		$Hand.process_mode = Node.PROCESS_MODE_INHERIT
		show()
		_on_started.emit()


func _input(event):
	if Input.is_key_pressed(KEY_X):
		hide()
		$Hand.process_mode = Node.PROCESS_MODE_DISABLED
		_on_quitted.emit()
