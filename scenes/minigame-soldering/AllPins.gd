extends GridContainer

var rows: int

var pins: Array


func _ready():
	pins = get_children()
	rows = len(pins) / columns
	
	print(get_pins(0, 0).name)


## Tolong ingat row dan col awal 0
## Cth: pin awal paling ujung adalah row=0 col=10
func get_pins(col: int, row: int) -> Control:
	var pin_num = col + columns * row
	return pins[pin_num]
