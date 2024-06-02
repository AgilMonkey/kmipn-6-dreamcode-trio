extends Area2D

signal signal_button(value)

func button_pressed():
	var button = get_parent().name.split("Button", 1)
	signal_button.emit(button[1]) # button[1] = Nomor/action tombolnya
