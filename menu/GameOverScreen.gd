extends Control




func _on_Main_Menu_pressed():
	get_tree().change_scene("res://menu/Menu.tscn")
	print("1")


func _on_Play_Again_pressed():
	get_tree().change_scene("res://level/level.tscn")
	print("2")
