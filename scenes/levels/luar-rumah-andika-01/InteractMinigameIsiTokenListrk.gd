extends Node2D


signal start_minigame(node)
signal stop_minigame


func _ready():
	$InteractArea.interact = Callable(self, "_interact_minigame")


func _interact_minigame():
	start_minigame.emit(self)
	await stop_minigame
	process_mode = Node.PROCESS_MODE_DISABLED
