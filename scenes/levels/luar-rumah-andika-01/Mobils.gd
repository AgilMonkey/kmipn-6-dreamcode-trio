extends Node2D


func _ready():
	$MobilAnim.animation_finished.connect(start_new_mobil_anim)


func start_new_mobil_anim(_anim_name):
	var rand_time = randf_range(6.0, 10.0)
	await get_tree().create_timer(rand_time).timeout
	var rand_anim = randi_range(0, 2)
	
	if rand_anim == 0:
		$MobilAnim.play("mobil_hijau")
	else:
		$MobilAnim.play("mobil_kuning")
