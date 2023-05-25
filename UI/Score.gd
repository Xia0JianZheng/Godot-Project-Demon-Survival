extends Label

func _process(delta):
	self.text = str("Score : ", Global.score)
