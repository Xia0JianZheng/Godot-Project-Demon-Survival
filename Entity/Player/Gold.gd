extends Label

func _process(delta):
	self.text = str("Gold : ", Global.gold)
