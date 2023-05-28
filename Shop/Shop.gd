extends Control

func _process(delta):
	$TabContainer/Upgrades/RichTextLabel/ShopItems/Strengh/StrenghCurrentLevel.text = str("Current level : ", Global.current_attack_level)
	$TabContainer/Upgrades/RichTextLabel/ShopItems/Defense/DefenseCurrentLevel.text = str("Current level : ", Global.current_defense_level)
	$TabContainer/Upgrades/RichTextLabel/ShopItems/AttackSpeed/AttackSpeedCurrentLevel.text = str("Current level : ", Global.current_attackSpeed_level)
	$TabContainer/Upgrades/RichTextLabel/ShopItems/MaxHealth/MaxHealthCurrentLevel.text = str("Current level : ", Global.current_maxHealth_level)
	
	
	$TabContainer/Upgrades/RichTextLabel/ShopItems/Strengh/AttackPrice.text = str("Price : ", Global.attack_level_price)
	$TabContainer/Upgrades/RichTextLabel/ShopItems/Defense/DefensePrice.text = str("Price : ", Global.defense_level_price)
	$TabContainer/Upgrades/RichTextLabel/ShopItems/AttackSpeed/AttackSpeedPrice.text = str("Price : ", Global.attackSpeed_level_price)
	$TabContainer/Upgrades/RichTextLabel/ShopItems/MaxHealth/MaxHealthPrice.text = str("Price : ", Global.maxHealth_level_price)
	
	if Global.current_attack_level == 10:
		$TabContainer/Upgrades/RichTextLabel/ShopItems/Strengh/BuyStrengh.disabled = true
	else:
		$TabContainer/Upgrades/RichTextLabel/ShopItems/Strengh/BuyStrengh.disabled = false
	if Global.current_defense_level == 10:
		$TabContainer/Upgrades/RichTextLabel/ShopItems/Defense/BuyDefense.disabled = true
	else:
		$TabContainer/Upgrades/RichTextLabel/ShopItems/Defense/BuyDefense.disabled = false
	if Global.current_attackSpeed_level == 10:
		$TabContainer/Upgrades/RichTextLabel/ShopItems/AttackSpeed/BuyAttackSpeed.disabled = true
	else:
		$TabContainer/Upgrades/RichTextLabel/ShopItems/AttackSpeed/BuyAttackSpeed.disabled = false
	if Global.current_maxHealth_level == 10:
		$TabContainer/Upgrades/RichTextLabel/ShopItems/MaxHealth/BuyMaxHealth.disabled = true
	else:
		$TabContainer/Upgrades/RichTextLabel/ShopItems/MaxHealth/BuyMaxHealth.disabled = false

func _on_BuyStrengh_pressed():
	if Global.gold >= Global.attack_level_price and Global.current_attack_level < 10:
		Global.damage += 1
		Global.current_attack_level += 1
		Global.gold -= Global.attack_level_price
		Global.attack_level_price += 100
		$TabContainer/Upgrades/RichTextLabel/ShopItems/Strengh/StrenghCurrentLevel.text = str("Current level : ", Global.current_attack_level)
		Global.save_gold()
		Global.save_player_stats()
		

func _on_BuyDefense_pressed():
	if Global.gold >= Global.defense_level_price and Global.current_defense_level < 10:
		Global.defense += 1
		Global.current_defense_level += 1
		Global.gold -= Global.defense_level_price
		Global.defense_level_price += 100
		$TabContainer/Upgrades/RichTextLabel/ShopItems/Defense/DefenseCurrentLevel.text = str("Current level : ", Global.current_defense_level)
		Global.save_gold()
		Global.save_player_stats()
		
func _on_BuyAttackSpeed_pressed():
	if Global.gold >= Global.attackSpeed_level_price and Global.current_attackSpeed_level < 10:
		Global.attackSpeed -= 0.1
		Global.current_attackSpeed_level += 1
		Global.gold -= Global.attackSpeed_level_price
		Global.attackSpeed_level_price += 200
		$TabContainer/Upgrades/RichTextLabel/ShopItems/AttackSpeed/AttackSpeedCurrentLevel.text = str("Current level : ", Global.current_attackSpeed_level)
		Global.save_gold()
		Global.save_player_stats()
		
func _on_BuyMaxHealth_pressed():
	if Global.gold >= Global.maxHealth_level_price and Global.current_maxHealth_level < 10:
		Global.hp_max += 10
		Global.current_maxHealth_level += 1
		Global.gold -= Global.maxHealth_level_price
		Global.maxHealth_level_price += 50
		$TabContainer/Upgrades/RichTextLabel/ShopItems/MaxHealth/MaxHealthCurrentLevel.text = str("Current level : ", Global.current_maxHealth_level)
		Global.save_gold()
		Global.save_player_stats()
		
func _on_TextureButton_pressed():
	get_tree().change_scene("res://menu/Menu.tscn")
