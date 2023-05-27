extends Node

var score = 0
var gold = 0
var playerName = ""

var hp_max = 0
var damage = 0
var defense = 0
var attackSpeed = 2.0

var current_attack_level = 0
var current_defense_level = 0
var current_attackSpeed_level = 0
var current_maxHealth_level = 0

func save_gold():
	var save_game = File.new()
	save_game.open("user://playerGold.save", File.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Gold")
	for node in save_nodes:
		# Check the node is an instanced scene so it can be instanced again during load.
		if node.filename.empty():
			print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			continue

		# Check the node has a save function.
		if !node.has_method("save"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue

		# Call the node's save function.
		var node_data = node.call("save")

		# Store the save dictionary as a new line in the save file.
		save_game.store_line(to_json(node_data))
	save_game.close()

func load_gold():
	var save_file = File.new()
	if save_file.file_exists("user://playerGold.save"):
		save_file.open("user://playerGold.save", File.READ)
		while !save_file.eof_reached():
			var line = save_file.get_line()
			var node_data = parse_json(line)
			if node_data and node_data is Dictionary and node_data.has("gold"):
				gold = node_data["gold"]
		save_file.close()
	else:
		print("Save game file does not exist.")

	# Display the loaded gold value
	print("Loaded gold: ", gold)

func save_score():
	var save_score = File.new()
	save_score.open("user://playerScore.save", File.READ_WRITE)
	save_score.seek_end()
	save_score.store_string(str(score) + "\n")
	print(score)
	save_score.close()

func save_name():
	var save_name = File.new()
	save_name.open("user://playerName.save", File.READ_WRITE)
	save_name.seek_end()
	save_name.store_string(playerName + "\n")
	print(playerName)
	save_name.close()

func save_current_score():
	var save_current_score = File.new()
	save_current_score.open("user://current_score.save", File.WRITE)
	var score_nodes = get_tree().get_nodes_in_group("Score")
	for node in score_nodes:
		# Check the node is an instanced scene so it can be instanced again during load.
		if node.filename.empty():
			print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			continue

		# Check the node has a save function.
		if !node.has_method("save"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue

		# Call the node's save function.
		var score_data = node.call("save")

		# Store the save dictionary as a new line in the save file.
		save_current_score.store_line(to_json(score_data))
	save_current_score.close()

func load_current_score():
	var save_file = File.new()
	if save_file.file_exists("user://currentScore.save"):
		save_file.open("user://currentScore.save", File.READ)
		while !save_file.eof_reached():
			var line = save_file.get_line()
			var node_data = parse_json(line)
			if node_data and node_data is Dictionary and node_data.has("score"):
				score = node_data["score"]
		save_file.close()
	else:
		print("Save game file does not exist.")

	# Display the loaded gold value
	print("Loaded current score: ", score)

func save_player_stats():
		# Create a ConfigFile instance
	var config = ConfigFile.new()

	# Set the variables
	config.set_value("Game", "hp_max", hp_max)
	config.set_value("Game", "damage", damage)
	config.set_value("Game", "defense", defense)
	config.set_value("Game", "attackSpeed", attackSpeed)

	# Save the configuration to a file
	var save_path = "user://save_shop.cfg"  # Specify the file path and name
	config.save(save_path)

func load_player_stats():
		# Create a ConfigFile instance
	var config = ConfigFile.new()

	# Load the configuration from a file
	var save_path = "user://save_shop.cfg"  # Specify the file path and name
	config.load(save_path)

	# Retrieve the variables
	var hp_max = config.get_value("Game", "hp_max", 0)
	var damage = config.get_value("Game", "damage", 0)
	var defense = config.get_value("Game", "defense", 0)
	var attackSpeed = config.get_value("Game", "attackSpeed", 2.0)
