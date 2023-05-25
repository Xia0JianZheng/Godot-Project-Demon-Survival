extends "res://Entity/Enemy/EnemyBase.gd"

export(PackedScene) var STONESPEAR: PackedScene = preload("res://Projectile/StoneGolemSpear.tscn")

onready var attackTimer = $AttackTimer
onready var attackPlayer = $AnimationPlayer

func _physics_process(delta):
	var player = get_parent().get_node("Player")
	if player != null and attackTimer.is_stopped():
		attackPlayer.play("attack")
	else :
		attackPlayer.play("run")
		
func throw_stone_spear(stonespear_direction: Vector2):
	if STONESPEAR:
		var stonespear = STONESPEAR.instance()
		get_tree().current_scene.add_child(stonespear)
		stonespear.global_position = self.global_position
		
		var stonespear_rotation = stonespear_direction.angle()
		stonespear.rotation = stonespear_rotation
		attackTimer.start()


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "attack":
		var player = get_parent().get_node("Player")
		var stonespear_direction = self.global_position.direction_to(player.global_position)
		throw_stone_spear(stonespear_direction)
