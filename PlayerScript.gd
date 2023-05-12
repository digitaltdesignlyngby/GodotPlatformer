extends KinematicBody2D

var speed : int = 50 
var jump_speed : int = 500
var gravity : int = 600 
var velocity = Vector2()
var acceleration = Vector2()

var directionLeft = true #Dette er kun for kunne se hvilken retning vi skal skyde 
var bullet = preload("res://Bullet.tscn")
var level1 = load("res://Level1.tscn")


#This is a fuction for player movement 
func get_input(delta):
	#velocity.x = velocity.x * 0.9
	#velocity.x = 0 
	
	#This is for the player to move right
	if Input.is_action_pressed("ui_right") && is_on_floor():
		velocity.x += speed
		directionLeft = false
	#This is for the player to move left
	if Input.is_action_pressed("ui_left") && is_on_floor():
		velocity.x -= speed
		directionLeft = true
	#This is for the player to jump 
	if Input.is_action_just_pressed("ui_up") && is_on_floor():
		#Checks to see if player is on the ground or not
			velocity.y -=jump_speed
	if Input.is_action_just_pressed("ui_accept"):
			var b = bullet.instance(PackedScene.GEN_EDIT_STATE_MAIN)
			b.position.x = position.x
			b.position.y = position.y
			if directionLeft : b.speed *= -1 
			get_parent().add_child(b)
			#add_child(b)
			#level1.add_child(b)
			#velocity.y -=jump_speed
		
		
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


#Process the physics?
func _physics_process(delta):
	get_input(delta)

