extends LineEdit

var playerName = ""

func save():
	var save_dict = {
		"Name" : playerName
	}
	return save_dict

func _on_PlayerName_text_entered(new_text):
	playerName = new_text
