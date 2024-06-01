extends Area2D
class_name InteractArea
## Sebuah base class buat semua objek yang akan berinteraksi dengan player
##
## Nanti akan di referensi oleh benda lain agar bisa diinteraksikan. Interaksi
## bisa dialog, event, dll.


var is_interacting := false
var interacted_count := 0

var interact_icon: InteractIcon

signal interacted


## Callable ini nanti akan di overwrite sama interaksi kalian sendiri
var interact: Callable = func():
	print("Interacting with " + name)


func _init():
	Dialogic.timeline_started.connect(func(): is_interacting = true)
	Dialogic.timeline_ended.connect(func(): is_interacting = false)
	
	interacted.connect(add_interacted_count)


func add_interacted_count():
	interacted_count += 1


func _on_body_entered(_body):
	InteractManager.register_area(self)


func _on_body_exited(_body):
	InteractManager.unregister_area(self)


func show_interact_icon():
	if interact_icon:
		interact_icon.interact()


func hide_interact_icon():
	if interact_icon:
		interact_icon.uninteract()
