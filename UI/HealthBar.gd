extends TextureProgress


func _ready():
	yield(get_tree(), "idle_frame")
	value = get_parent().get_physics_process_delta_time()
	if self.is_in_group("Player"):
		max_value = get_parent().Global.hp_max
	else:
		max_value = get_parent().hp_max

func animate_hp_change(new_hp: int, old_hp: int = value):
	$Tween.interpolate_property(self, "value", old_hp,
			new_hp, 0.1, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0.025)
	$Tween.start()
