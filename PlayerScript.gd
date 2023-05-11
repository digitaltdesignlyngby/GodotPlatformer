extends KinematicBody2D

var speed : int = 400 
var jump_speed : int = 200
var gravity : int = 200 
var velocity = Vector2()

#This is a fuction for player movement 
func get_input(delta): 
	velocity.x = 0 
	
	#This is for the player to move right
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	#This is for the player to move left
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed
	#This is for the player to jump 
	if Input.is_action_just_pressed("ui_up"):
		#Checks to see if player is on the ground or not 
		if ( is_on_floor()):
			velocity.y -=jump_speed
		
		
	# gravity 
	velocity.y += gravity * delta 
	velocity = move_and_slide(velocity, Vector2.UP)
	pass 


#Process the physics?
func _physics_process(delta):
	get_input(delta)

