extends Node2D

@onready var tween = $Tween

#func _ready():
	#makan_makanan()
#
#func makan_makanan():
	#var areas_accept = $EatZone.get_overlapping_bodies()
	#print("makan_makanan")
	#if len(areas_accept) > 0:
		#print("hand on EatZone")
		#$Tangan.set_input(false)
		#var target_position = position + Vector2(0, 100)  # Move down by 100 pixels
		#tween.tween_property(self, "position", target_position, 2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		##$Tangan.set_input(true)

func _on_grab_area_area_entered(area):
	print("area_area_entered: " + area.name)
	if area.name == 'EatZone':
		print("")
