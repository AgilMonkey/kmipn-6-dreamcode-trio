extends Interactable

func interact():
	var layout = Dialogic.start("test_timeline")
	layout.register_character(load("res://dialogic-stuff/characters/flower.dch"), $SpeechBubblePivot)
	return layout
