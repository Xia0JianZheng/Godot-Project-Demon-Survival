extends Control




func _on_Main_Menu_pressed():
	get_tree().change_scene("res://menu/Menu.tscn")


func _on_Play_Again_pressed():
	get_tree().change_scene("res://level/level.tscn")


func _on_Shop_pressed():
	get_tree().change_scene("res://menu/Shop.tscn")
