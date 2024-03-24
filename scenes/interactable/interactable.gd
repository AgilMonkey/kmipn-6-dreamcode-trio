extends Area2D
class_name Interactable
## Sebuah base class buat semua objek yang akan berinteraksi dengan player
##
## Nanti akan di referensi oleh benda lain agar bisa diinteraksikan. Interaksi
## bisa dialog, event, dll.


@export var icon_offset: Vector2 = Vector2(0, 100)

var is_interacting := false

@onready var interact_icon: Sprite2D = get_node("InteractIcon")


func _ready():
	interact_icon.position = icon_offset


## Fungsi ini nanti akan di overwrite sama interaksi kalian sendiri
func interact():
	print("Interacting with " + name)


func _on_area_entered(area):
	interact_icon.show()


func _on_area_exited(area):
	interact_icon.hide()
