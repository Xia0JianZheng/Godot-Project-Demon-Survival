extends "res://Entity/EntityBase.gd"

export(PackedScene) var ICESPEAR: PackedScene = preload("res://Projectile/PlayerIceSpear.tscn")

onready var attackTimer = $AttackTimer

func _physics_process(delta):
	var input_dir = get_input_direction()
	if input_dir != Vector2.ZERO:
		velocity = SPEED * input_dir
		animPlayer.play("run")
		if input_dir.x != 0 and sign(sprite.scale.x) != sign(input_dir.x):
				sprite.scale.x *= -1
	else:
		velocity = Vector2.ZERO
		animPlayer.play("run")
	
	if Input.is_action_just_pressed("action_attack") and attackTimer.is_stopped():
		var icespear_direction = self.global_position.direction_to(get_global_mouse_position())
		throw_ice_spear(icespear_direction)
	
	move()

func throw_ice_spear(icespear_direction: Vector2):
	if ICESPEAR:
		var icespear = ICESPEAR.instance()
		get_tree().current_scene.add_child(icespear)
		icespear.global_position = self.global_position
		
		var icespear_rotation = icespear_direction.angle()
		icespear.rotation = icespear_rotation
		
		attackTimer.start()

func get_input_direction() -> Vector2:
	var input_dir: Vector2 = Vector2.ZERO
	
	input_dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_dir.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_dir = input_dir.normalized()

	return input_dir


