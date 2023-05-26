extends Control

func _on_Main_Menu_pressed():
	get_tree().change_scene("res://menu/Menu.tscn")


func _on_Play_Again_pressed():
	get_tree().change_scene("res://level/level.tscn")


func _on_Shop_pressed():
	get_tree().change_scene("res://menu/Shop.tscn")

func _on_Submit_pressed():
	var global = get_node("/root/Global") 
	if global != null:
		global.save_name()
		global.save_score()

func _on_GameOverMenu_ready():
	$GameOverMenu/PlayAgain.grab_focus()
