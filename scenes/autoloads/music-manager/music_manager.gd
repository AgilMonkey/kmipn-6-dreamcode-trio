extends Node


var calm_bgm := preload("res://assets/music/041415calmbgm.ogg")
var chill_lofi_bgm := preload("res://assets/music/ChillLofiR.mp3")
var stroking_surgery_bgm := preload("res://assets/music/Stroking Surgery.mp3")
var pleasant_creek_bgm := preload("res://assets/music/Pleasant Creek Pack/Pleasant Creek Loop.wav")

@onready var audio_stream_player := $AudioStreamPlayer
var volume := 0

func play(stream):
	if stream == audio_stream_player.stream:
		return
	
	audio_stream_player.stream = stream
	audio_stream_player.volume_db = -30
	
	audio_stream_player.play() 
	var volume_tween = get_tree().create_tween()
	volume_tween.tween_property(audio_stream_player, "volume_db", volume, 0.5)


func stop():
	var volume_tween = get_tree().create_tween()
	volume_tween.tween_property(audio_stream_player, "volume_db", -30, 0.5)
	volume_tween.finished
	audio_stream_player.stop()
