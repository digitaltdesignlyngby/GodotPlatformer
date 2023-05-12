extends KinematicBody2D

var speed : int = 50
var jump_speed : int = 500
var gravity : int = 600
var velocity = Vector2()
var acceleration = Vector2()

var directionLeft = true #Dette er kun for kunne se hvilken retning vi skal skyde
var bullet = preload("res://Bullet.tscn")



#This is a fuction for player movement 
func get_input(delta):
	#mouseInputs(delta)
	keyInputs(delta)
	updateAll(delta)
	pass

func _input(event):
	if event is InputEventScreenTouch || event is InputEventScreenDrag:
		var mx = event.position.x
		var my = event.position.y
		if mx > 800 && my > 250:
			velocity.x += speed
			directionLeft = false
			return
		if mx < 300 && my > 250:
			velocity.x -= speed
			directionLeft = true
			return
		if my < 250 && mx> 300 && is_on_floor():
			velocity.y -=jump_speed
			return
		#i alle andre tilfælde skyd
		if mx > 300 && mx < 800 && my > 250: 
			#var b = bullet.instance(PackedScene.GEN_EDIT_STATE_INSTANCE) ## MEGET VIGTIGT instance() HVIS EXPORT!!!
			var b = bullet.instance()
			b.position.x = position.x
			b.position.y = position.y
			if directionLeft : b.speed *= -1
			get_parent().add_child(b)
		

func mouseInputs(delta):
	var mx = get_viewport().get_mouse_position()[0]
	var my = get_viewport().get_mouse_position()[1]
	$Label.text = "hej"	
	if Input.is_action_just_pressed("touch"):
		if mx > 800 && my > 250:
			velocity.x += speed
			directionLeft = false
			return
		if mx < 300 && my > 250:
			velocity.x -= speed
			directionLeft = true
			return
		if my < 250 && mx> 300 && is_on_floor():
			velocity.y -=jump_speed
			return
		#i alle andre tilfælde skyd
		if mx > 300 && mx < 800 && my > 250: 
			#var b = bullet.instance(PackedScene.GEN_EDIT_STATE_INSTANCE) ## MEGET VIGTIGT instance() HVIS EXPORT!!!
			var b = bullet.instance()
			b.position.x = position.x
			b.position.y = position.y
			if directionLeft : b.speed *= -1
			get_parent().add_child(b)
		
	
func keyInputs(delta):	
	if Input.is_action_pressed("ui_right") && is_on_floor():
		velocity.x += speed
		directionLeft = false
	if Input.is_action_pressed("ui_left") && is_on_floor():
		velocity.x -= speed
		directionLeft = true
	if Input.is_action_just_pressed("ui_up") && is_on_floor():
		velocity.y -=jump_speed
	if Input.is_action_just_pressed("shoot"):
		var b = bullet.instance(PackedScene.GEN_EDIT_STATE_INSTANCE) ## MEGET VIGTIGT instance() HVIS EXPORT!!!
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


#Process the physics?
func _physics_process(delta):
	get_input(delta)

