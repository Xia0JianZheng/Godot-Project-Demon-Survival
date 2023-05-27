extends Control

func _process(delta):
	if Global.current_attack_level == 10:
		$TabContainer/Upgrades/RichTextLabel/control/Strengh/BuyStrengh.disabled = true
	if Global.current_defense_level == 10:
		$TabContainer/Upgrades/RichTextLabel/control/Strengh/BuyDefense.disabled = true
	if Global.current_attackSpeed_level == 10:
		$TabContainer/Upgrades/RichTextLabel/control/Strengh/BuyAttackSpeed.disabled = true
	if Global.current_maxHealth_level == 10:
		$TabContainer/Upgrades/RichTextLabel/control/Strengh/BuyMaxHealth.disabled = true

func _on_BuyStrengh_pressed():
	Global.damage += 1
	if Global.current_attack_level < 10:
		Global.current_attack_level += 1
		$TabContainer/Upgrades/RichTextLabel/control/Strengh/StrenghCurrentLevel.text = str("Current level : ", Global.current_attack_level)

func _on_BuyDefense_pressed():
	Global.defense += 1
	if Global.current_defense_level < 10:
		Global.current_defense_level += 1
		$TabContainer/Upgrades/RichTextLabel/control/Defense/DefenseCurrentLevel.text = str("Current level : ", Global.current_defense_level)

func _on_BuyAttackSpeed_pressed():
	Global.attackSpeed -= 0.1
	if Global.current_attackSpeed_level < 10:
		Global.current_attackSpeed_level += 1
		$TabContainer/Upgrades/RichTextLabel/control/AttackSpeed/AttackSpeedCurrentLevel.text = str("Current level : ", Global.current_attackSpeed_level)

func _on_BuyMaxHealth_pressed():
	Global.hp_max += 10
	if Global.current_attackSpeed_level < 10:
		Global.current_attackSpeed_level += 1
		$TabContainer/Upgrades/RichTextLabel/control/MaxHealth/MaxHealthCurrentLevel.text = str("Current level : ", Global.current_maxHealth_level_level)

func _on_TextureButton_pressed():
	get_tree().change_scene("res://menu/Menu.tscn")
