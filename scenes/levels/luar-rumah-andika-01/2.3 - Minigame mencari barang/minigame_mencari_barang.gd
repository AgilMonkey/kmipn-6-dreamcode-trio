extends Node2D


signal minigame_selesai


func key_found():
	$HandCursor.process_mode = Node.PROCESS_MODE_DISABLED
	var layout = Dialogic.start("res://scenes/levels/luar-rumah-andika-01/2.3 - Minigame mencari barang/ketemu_kunci_dialoge.dtl")
	layout.register_character(load("res://dialogic-stuff/characters/Andika.dch"), $AndikaSpeechPivot)
	
	await Dialogic.timeline_ended
	minigame_selesai.emit()

