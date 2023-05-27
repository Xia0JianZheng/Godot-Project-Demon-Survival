extends LineEdit

func _on_PlayerName_text_entered(new_text):
	Global.playerName = new_text



func _on_PlayerName_text_changed(new_text):
	Global.playerName = new_text
