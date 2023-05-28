extends Node2D

var skeleton = preload("res://Entity/Enemy/Skeleton.tscn")
var stoneGolem = preload("res://Entity/Enemy/StoneGolem.tscn")
var slime = preload("res://Entity/Enemy/Slime.tscn")
onready var ySort = $YSortNode

func _ready():
	randomize()
	$AudioStreamPlayer.play()

func _on_SkeletonSpawnTimer_timeout():
	var rngSkeleton = RandomNumberGenerator.new()
	rngSkeleton.randomize()
	var player = get_node("/root/Level/YSortNode/Player")
	if player != null:
		$spawn/PathFollow2D.offset = rngSkeleton.randi_range(0, 5656)
		var skeletonInstance = skeleton.instance()
		
		skeletonInstance.global_position = $spawn/PathFollow2D/Position2D.global_position
		ySort.add_child(skeletonInstance)

func _on_StoneGolemSpawnTimer_timeout():
	var rngStoneGolem = RandomNumberGenerator.new()
	rngStoneGolem.randomize()
	var player = get_node("/root/Level/YSortNode/Player")
	if player != null:
		$spawn/PathFollow2D.offset = rngStoneGolem.randi_range(0, 5656)
		var stoneGolemInstance = stoneGolem.instance()
		
		stoneGolemInstance.global_position = $spawn/PathFollow2D/Position2D.global_position
		ySort.add_child(stoneGolemInstance)

func _on_SlimeSpawnTimer_timeout():
	var rngSlime = RandomNumberGenerator.new()
	rngSlime.randomize()
	var player = get_node("/root/Level/YSortNode/Player")
	if player != null:
		$spawn/PathFollow2D.offset = rngSlime.randi_range(0, 5656)
		var slimeInstance = slime.instance()
		
		slimeInstance.global_position = $spawn/PathFollow2D/Position2D.global_position
		ySort.add_child(slimeInstance)




func _on_MenuPause_ready():
	$PauseMenu/Pause/Menu/MenuPause/SaveGame.grab_focus()
