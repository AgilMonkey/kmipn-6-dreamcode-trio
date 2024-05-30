extends Area2D


func _on_area_entered(area):
	get_parent().queue_free()
