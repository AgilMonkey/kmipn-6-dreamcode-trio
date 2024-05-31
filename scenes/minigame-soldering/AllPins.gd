extends GridContainer

var rows: int

var pins: Array


func _ready():
	pins = get_children()
	rows = len(pins) / columns


## Tolong ingat row dan col awal 0
## Cth: pin awal paling ujung adalah col=9 row=0 
func get_pin(col: int, row: int) -> Control:
	var pin_num = col + columns * row
	return pins[pin_num]
