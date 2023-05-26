extends Label

var score = 0
func _process(_delta):
	score = Global.score 
	self.text = str("Score : ", score)

func save():
	var save_dict = {
		"score" : score
	}
	return save_dict
