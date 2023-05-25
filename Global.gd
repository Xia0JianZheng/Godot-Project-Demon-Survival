extends Node

var score = 0
var gold = 0
var playerDamage = 0

var shop
var save_shop_path = 'res://save/shop'

func save_shop():
	var file = File.new()
	file.open(save_shop_path, file.WRITE_READ)
	file.store_var(shop)
	file.close()

func load_shop():
	var file = File.new()
	if not file.file_exists(save_shop_path):
		return false
	file.open(save_shop_path, file.READ)
	shop = file.get_var()
	file.close()
	return true

