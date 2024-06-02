extends Node2D





# Called when the node enters the scene tree for the first time.
func _ready():
	MusicManager.volume = -10
	MusicManager.play(MusicManager.stroking_surgery_bgm)
	await get_tree().create_timer(1.2).timeout
	var layout = Dialogic.start("res://scenes/levels/ruang-kelas-andika-01/dialog_kelas.dtl")
	layout.register_character(load("res://dialogic-stuff/characters/Guru.dch"), $PakGuruPivot)
	layout.register_character(load("res://dialogic-stuff/characters/Semuanya.dch"), $SemuanyaPivot)
	await Dialogic.timeline_ended
