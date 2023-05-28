extends Control

func _onready():
	$GameOverMenu/Submit.disabled = false

func _on_Main_Menu_pressed():
	get_tree().change_scene("res://menu/Menu.tscn")

func _on_Shop_pressed():
	get_tree().change_scene("res://Shop/Shop.tscn")

func _on_Submit_pressed():
	$PlayerName.text = ""
	var global = get_node("/root/Global") 
	if global != null:
		print("saving Score")
		global.save_name()
		global.save_score()
		$GameOverMenu/Submit.disabled = true

func _on_GameOverMenu_ready():
	$GameOverMenu/Submit.grab_focus()
