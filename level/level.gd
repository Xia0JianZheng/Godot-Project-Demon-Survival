extends Node2D

var skeleton = preload("res://Entity/Enemy/Skeleton.tscn")
var stoneGolem = preload("res://Entity/Enemy/StoneGolem.tscn")
onready var ySort = $YSortNode

func _ready():
	randomize()
	
func _process(delta):
	if Input.is_key_pressed(KEY_ENTER):
		get_tree().change_scene("res://menu/shop.tscn")


func _on_SkeletonSpawnTimer_timeout():
	var rngSkeleton = RandomNumberGenerator.new()
	rngSkeleton.randomize()
	var player = get_node("/root/Level/YSortNode/Player")
	if player != null:
		$Path2D/PathFollow2D.offset = rngSkeleton.randi_range(0, 5656)
		var skeletonInstance = skeleton.instance()
		
		skeletonInstance.global_position = $Path2D/PathFollow2D/Position2D.global_position
		ySort.add_child(skeletonInstance)

func _on_StoneGolemSpawnTimer_timeout():
	var rngStoneGolem = RandomNumberGenerator.new()
	rngStoneGolem.randomize()
	var player = get_node("/root/Level/YSortNode/Player")
	if player != null:
		$Path2D/PathFollow2D.offset = rngStoneGolem.randi_range(0, 5656)
		var stoneGolemInstance = stoneGolem.instance()
		
		stoneGolemInstance.global_position = $Path2D/PathFollow2D/Position2D.global_position
		ySort.add_child(stoneGolemInstance)


func _on_SaveGame_pressed():
	var data = {
		
	}
