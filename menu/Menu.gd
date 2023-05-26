extends Node

func _on_NewGame_pressed():
	get_tree().change_scene("res://level/level.tscn")


func _on_Continue_pressed():
	print("continue")


func _on_Scoreboard_pressed():
	print("score")


func _on_Shop_pressed():
	print("shop")


func _on_Exit_pressed():
	get_tree().quit()


func _on_OptionsMenu_ready():
	$TittleMenu/OptionsMenu/NewGame.grab_focus()
