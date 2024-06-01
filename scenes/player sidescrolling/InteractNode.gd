extends Area2D


var all_interactable: Array


func interact():
	pass
	#var all_interact = get_overlapping_areas()
	#for obj: Interactable in all_interact:
		#if obj is InteractableDialogue:
			#var layout = obj.interact()
			#layout.register_character(load("res://dialogic-stuff/characters/test_mc.dch"), $TextBubblePivot)
			#break
		#
		#obj.interact()
		#break


func _on_area_entered(area):
	if not area.has_signal("interacting_this"):
		return
	
	all_interactable.append(area)
	
	var highest_order: int = 0
	var node_highest_order
	for node in all_interactable:
		node.stop_interacting_this.emit()
		var cur_node_order = node.get_index()
		if cur_node_order > highest_order:
			highest_order = cur_node_order
			node_highest_order = node
	
	if node_highest_order:
		node_highest_order.interacting_this.emit()


func _on_area_exited(area):
	if not area.has_signal("interacting_this"):
		return
	
	all_interactable.erase(area)
	
	area.stop_interacting_this.emit()
	
	var highest_order: int = 0
	var node_highest_order
	for node in all_interactable:
		node.stop_interacting_this.emit()
		var cur_node_order = node.get_index()
		if cur_node_order > highest_order:
			highest_order = cur_node_order
			node_highest_order = node
			
	if node_highest_order:
		node_highest_order.interacting_this.emit()
