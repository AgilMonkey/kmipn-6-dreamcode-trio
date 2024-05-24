@tool
extends SubViewport


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var children = get_children()
	
	if len(children) < 1:
		return
	
	if children[0] is Control:
		size = children[0].size
