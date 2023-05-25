extends "res://Entity/EntityBase.gd"

func _physics_process(delta):
	var player = get_parent().get_node("Player")
	
	if player != null:
		var direction = (player.position - position).normalized()
		move_and_slide(direction * SPEED)
		if player.position.x < position.x:
			# Player is on the left side
			self.sprite.flip_h = true# Flip the sprite horizontally
		else:
			# Player is on the right side
			self.sprite.flip_h = false
	else:
		queue_free()
