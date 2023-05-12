extends "res://PlayerScript.gd"

func _ready():
	speed = 10

func _input(event):
	pass

func get_input(delta):
	if rand_range(-1.0,40.0) < 0:						speed 		*=	-1
	if rand_range(-1.0,80.0) < 0 && is_on_floor():		velocity.y 	-=	jump_speed
	if is_on_floor():									velocity.x 	+=	speed
	updateAll(delta)
