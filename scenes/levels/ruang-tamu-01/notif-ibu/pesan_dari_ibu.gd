extends Control


signal pressed_any
signal animation_hp_selesai


func _input(event):
	if Input.is_anything_pressed():
		pressed_any.emit()


func mulai():
	visible = true
	$AnimationHP.play("start")


func selesai():
	$TekanTombolApapun/AnimationTombolApapun.play("start")
	await pressed_any
	$AnimationHP.play("selesai")
	$TekanTombolApapun/AnimationTombolApapun.play_backwards("start")
	await $AnimationHP.animation_finished
	animation_hp_selesai.emit()
	visible = false
