extends Label

var gold = 0

func _process(_delta):
	gold = Global.gold 
	self.text = str("Gold : ", gold)

func save():
	var save_dict = {
		"gold" : gold
	}
	return save_dict
