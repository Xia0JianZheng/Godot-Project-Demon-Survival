extends Control

func _input(event):
	if event.is_action_pressed("pause"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		visible = new_pause_state


func _on_MainMenu_pressed():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	get_tree().change_scene("res://menu/Menu.tscn")

func _on_SaveGame_pressed():
	var global = get_node("/root/Global") 
	if global != null:
		global.save_gold()
		global.save_current_score()
		global.save_player_stats()
		get_tree().change_scene("res://menu/Menu.tscn")
		get_tree().paused = false
