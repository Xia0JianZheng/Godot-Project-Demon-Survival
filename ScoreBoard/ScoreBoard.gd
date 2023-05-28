extends Control

func _ready():
	
	var playerName = File.new()
	
	playerName.open("user://playerName.save", File.READ_WRITE)
	var playerScore = File.new()
	playerScore.open("user://playerScore.save", File.READ_WRITE)
	
	while !playerName.eof_reached():
		
		var name = playerName.get_line()
		var score = playerScore.get_line()
		var dynamic_font = DynamicFont.new()
		dynamic_font.font_data = load("res://Assets/font/m6x11.ttf")
		dynamic_font.size = 32
		
		var pName = Label.new()
		pName.set_size(Vector2(50,50))
		pName.add_font_override("font", dynamic_font)
		pName.set_align(1)
		pName.set_text(name)


		var pScore = Label.new()
		pScore.set_size(Vector2(50,50))
		pScore.add_font_override("font", dynamic_font)
		pScore.set_align(1)
		pScore.set_text(score)

		$VBoxPlayerNameContainer.add_child(pName)
		$VBoxPlayerScoreContainer.add_child(pScore)


func _on_TextureButton_pressed():
	get_tree().change_scene("res://menu/Menu.tscn")
