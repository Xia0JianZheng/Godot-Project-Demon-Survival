extends "res://overlap/Hitbox.gd"

export(int) var SPEED: int = 100

onready var animPlayer = $AnimationPlayer
onready var collisionShape = $CollisionShape2D

func _ready():
	damage += Global.damage

func _physics_process(delta):
	if(collisionShape.disabled == false):
		var direction = Vector2.RIGHT.rotated(rotation)
		global_position += SPEED * direction * delta
	else:
		SPEED = 0

func hit():
	disableCollision()
	animPlayer.play("hit")
	animPlayer.connect("animation_finished", self, "_on_animation_finished")

func _on_animation_finished(animation_name: String):
	if animation_name == "hit":
		destroy()

func disableCollision():
	self.collisionShape.set_deferred("disabled", true)
	
func destroy():
	queue_free()

func _on_PlayerIceSpear_area_entered(area):
	hit()

func _on_PlayerIceSpear_body_entered(body):
	hit()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
