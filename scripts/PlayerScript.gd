extends KinematicBody2D

var speed : int = 50
var jump_speed : int = 500
var gravity : int = 600
var velocity = Vector2()


var directionLeft = true #Dette er kun for kunne se hvilken retning vi skal skyde
var bullet = preload("res://scenes/Bullet.tscn")

func _ready():
	pass

#Process the physics? ---
func _physics_process(delta):
	get_input(delta)

#This is a fuction for player movement 
func get_input(delta):
	guiInputs(delta)
	updateAll(delta)
	pass
		
func guiInputs(delta):
	#is_action_just_pressed... betyder kun en gang 
	if (Globals.up 		|| Input.is_action_just_pressed("ui_up"))	&& is_on_floor(): 
		velocity.y -=jump_speed
	if (Globals.left 	|| Input.is_action_pressed("ui_left"))  	&& is_on_floor():
		velocity.x -= speed
		directionLeft = true
	if (Globals.right 	|| Input.is_action_pressed("ui_right"))		 && is_on_floor():
		velocity.x += speed
		directionLeft = false	
	if (Globals.shoot 	|| Input.is_action_just_pressed("shoot")):
		Globals.shoot = false
		var b = bullet.instance() ## MEGET VIGTIGT instance() HVIS EXPORT!!!
		b.position.x = position.x
		b.position.y = position.y
		if directionLeft : b.speed *= -1
		get_parent().add_child(b)
	
	
func updateAll(delta):
	# gravity 
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if is_on_floor():
		velocity.x*=0.90
	
	if position.y > 400:
		position.y= -400
		position.x = 200
		#print("game over")
	pass



