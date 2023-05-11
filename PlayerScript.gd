extends KinematicBody2D

var speed : int = 400 
var jump_speed : int = 300
var gravity : int = 200 
var velocity = Vector2()
var acceleration = Vector2()

#This is a fuction for player movement 
func get_input(delta):
	#velocity.x = velocity.x * 0.9
	#velocity.x = 0 
	
	#This is for the player to move right
	if Input.is_action_pressed("ui_right") && is_on_floor():
		velocity.x += 10
	#This is for the player to move left
	if Input.is_action_pressed("ui_left") && is_on_floor():
		velocity.x -= 10
	#This is for the player to jump 
	if Input.is_action_just_pressed("ui_up") && is_on_floor():
		#Checks to see if player is on the ground or not
			velocity.y -=jump_speed
		
		
	# gravity 
	velocity.y += gravity * delta 
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if is_on_floor():
		velocity.x*=0.95
	
	if position.y > 400: 
		position.y= -400
		position.x = 200
		print("game over")
	
	pass 


#Process the physics?
func _physics_process(delta):
	get_input(delta)

