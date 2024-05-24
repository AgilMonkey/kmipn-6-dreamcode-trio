extends QuestItem

signal key_got

func interact():
	key_got.emit()
	hide()
	$CollisionShape2D.disabled = true
