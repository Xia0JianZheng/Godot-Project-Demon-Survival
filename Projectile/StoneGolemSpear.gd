extends "res://overlap/Hitbox.gd"

export(int) var SPEED: int = 100

onready var animPlayer = $AnimationPlayer
onready var collisionShape = $CollisionShape2D

func _physics_process(delta):
	if(collisionShape.disabled == false):
		var direction = Vector2.RIGHT.rotated(rotation)
		global_position += SPEED * direction * delta
	else:
		SPEED = 0
		
func hit():
	disableCollision()
	queue_free()

func disableCollision():
	self.collisionShape.set_deferred("disabled", true)
	

func destroy():
	queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	hit()

func _on_StoneGolemSpear_area_entered(area):
	hit()

func _on_StoneGolemSpear_body_entered(body):
	hit()
