extends Area2D
class_name Interactable
## Sebuah base class buat semua objek yang akan berinteraksi dengan player
##
## Nanti akan di referensi oleh benda lain agar bisa diinteraksikan. Interaksi
## bisa dialog, event, dll.

var is_interacting := false

@export var interact_icon: Sprite2D


func _ready():
	Dialogic.timeline_started.connect(func(): is_interacting = true)
	Dialogic.timeline_ended.connect(func(): is_interacting = false)
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)


func _process(delta):
	visible = not is_interacting 

## Fungsi ini nanti akan di overwrite sama interaksi kalian sendiri
func interact():
	print("Interacting with " + name)


func _on_area_entered(area):
	if interact_icon: interact_icon.show()


func _on_area_exited(area):
	if interact_icon: interact_icon.hide()
