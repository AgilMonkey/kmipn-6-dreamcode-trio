@tool
extends GridContainer

var rows: int
var pins: Array


func _init():
	pins = get_children()
	rows = len(pins) / columns
	set_pin_script()
	set_pin_connection()


func set_pin_script():
	pins = get_children()
	for p in pins:
		p.set_script(load("res://scenes/minigame-soldering/pin.gd"))
	rows = len(pins) / columns


func set_pin_connection():
	for col in range(columns):
		for row in range(rows):
			var pin: Pin = get_pin(col, row)
			pin.row_col = Vector2(row, col)
			pin.pin_up = get_pin(pin.row_col.x, pin.row_col.y - 1)
			pin.pin_down = get_pin(pin.row_col.x, pin.row_col.y + 1)
			pin.pin_left = get_pin(pin.row_col.x - 1, pin.row_col.y)
			pin.pin_right = get_pin(pin.row_col.x + 1, pin.row_col.y)


## Tolong ingat row dan col awal 0
## Cth: pin awal paling ujung adalah col=9 row=0 
func get_pin(col: int, row: int) -> Pin:
	if col > columns or col < 0 or row > rows or row < 0:
		return null
	
	var pin_num = col + columns * row
	return pins[pin_num]
