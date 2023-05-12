extends Area2D

var speed = 500
#var velocity = Vector2()

func _physics_process(delta):
	#velocity.x = speed*delta
	#velocity = move_and_slide(velocity, Vector2.UP)
	position.x += speed*delta #transform.x * speed * delta
	#velocity = move_and_slide(velocity, Vector2.UP)
"""
func _on_Bullet_body_entered(body):
	if body.is_in_group("mobs"):
		body.queue_free()
	queue_free()
"""


func _on_Bullet_body_entered(body):
	if !body.is_in_group("PlayerGroup") && !body.is_in_group("MapGroup"):
		body.queue_free()
		queue_free()
	if body.is_in_group("MapGroup"):
		queue_free()
	
	print("OMG A HIT!")
	pass # Replace with function body.
