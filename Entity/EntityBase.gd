extends KinematicBody2D

signal hp_max_changed(new_hp_max)
signal hp_changed(new_hp)
signal died

const INDICATOR_DAMAGE = preload("res://UI/DamageIndicator.tscn")

export(int) var hp_max: int = 100 setget set_hp_max
export(int) var hp: int = hp_max setget set_hp, get_hp
export(int) var defense: int = 0

export(int) var SPEED: int = 40
var velocity: Vector2 = Vector2.ZERO

export(bool) var receives_knockback: bool = true
export(float) var knockback_modifier: float = 0.2

export(PackedScene) var WIZARD_EFFECT_DIED: PackedScene = null
export(PackedScene) var SKELETON_EFFECT_DIED: PackedScene = null
export(PackedScene) var STONEGOLEM_EFFECT_DIED: PackedScene = null
export(PackedScene) var SLIME_EFFECT_DIED: PackedScene = null

onready var sprite = $Sprite
onready var collShape = $CollisionShape2D
onready var animPlayer = $AnimationPlayer
onready var hurtbox = $HurtBox
onready var healthBar = $HealthBar

onready var HealthBarTimer = $HealthBarTimer
onready var KnockBackTimer = $KnockBackTimer

func get_hp():
	return hp

func set_hp(value):
	if value != hp:
		hp = clamp(value, 0, hp_max)
		emit_signal("hp_changed", hp)
		if self.is_in_group("Player"):
			Global.current_hp = hp
		#healthBar.value = hp
		healthBar.animate_hp_change(hp)
		
		HealthBarTimer.start()
		
		if hp <= 0:
			emit_signal("died")
		elif hp != hp_max:
			healthBar.show()
		
func set_hp_max(value):
		if value != hp_max:
			hp_max = max(0, value)
			emit_signal("hp_max_changed", hp_max)
			
			var healthBar = get_node("HealthBar")
			if healthBar:
				healthBar.max_value = hp_max
				hp = hp_max  # Ensure the current health doesn't exceed the new maximum
				emit_signal("hp_changed", hp)

func _physics_process(delta):
	
	if HealthBarTimer.is_stopped():
		healthBar.hide()
	move()

func move():
	velocity = move_and_slide(velocity)
	
func die():
	if self.is_in_group("Wizard"):
		SPEED = 0
		spawn_effect(WIZARD_EFFECT_DIED)
		queue_free()
		get_tree().change_scene("res://menu/GameOverScreen.tscn")
	if self.is_in_group("Skeleton"):
		SPEED = 0
		Global.score += 10
		Global.gold += 2
		spawn_effect(SKELETON_EFFECT_DIED)
		queue_free()
	if self.is_in_group("StoneGolem"):
		Global.score += 20
		Global.gold += 5
		SPEED = 0
		spawn_effect(STONEGOLEM_EFFECT_DIED)
		queue_free()
	if self.is_in_group("Slime"):
		Global.score += 1
		Global.gold += 1
		SPEED = 0
		spawn_effect(SLIME_EFFECT_DIED)
		queue_free()

func receive_damage(base_damage: int):
	var actual_damage = base_damage
	
	actual_damage -= defense

	self.hp -= actual_damage
		
	return actual_damage


func receive_knockback(damage_source_pos: Vector2, receive_damage: int):
		if receives_knockback:
			var knockback_direction = damage_source_pos.direction_to(self.global_position)
			var knockback_strength = 10 * knockback_modifier
			var knockback = knockback_direction * knockback_strength
			
			global_position += knockback

func _on_HurtBox_area_entered(hitbox):
	
	var actual_damage = receive_damage(hitbox.damage)
	
	if hitbox.is_in_group("Projectile") or hitbox.is_in_group("Projectile"):
		hitbox.hit()
		
	receive_knockback(hitbox.global_position, actual_damage)
	
	spawn_damageIndicator(actual_damage)

func _on_EntityBase_died():
	die()

func spawn_effect(EFFECT: PackedScene, effect_position: Vector2 = global_position):
	if EFFECT:
		var effect = EFFECT.instance()
		get_tree().current_scene.add_child(effect)
		effect.global_position = effect_position
		return effect

func spawn_damageIndicator(damage: int):
	var indicator = spawn_effect(INDICATOR_DAMAGE)
	if indicator:
		indicator.label.text = str(damage)
