extends Node2D

export(int) var SPEED: int = 60
export(int) var FRICTION: int = 30
var SHIFT_DIRECTION: Vector2 = Vector2.ZERO

onready var label = $Label
onready var hitSound = $HitSound

func _ready():
	hitSound.play()
	SHIFT_DIRECTION = Vector2(rand_range(-1, 1), rand_range(-1,1))


func _process(delta):
	global_position += SPEED * SHIFT_DIRECTION * delta
	SPEED = max(SPEED - FRICTION * delta, 0)
