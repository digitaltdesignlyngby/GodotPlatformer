extends Node2D

func _on_Button_button_down():
	if !Globals.cameraPlayer:
		Globals.cameraPlayer  = true
		var playerNode        = get_parent().get_node("Player")
		var playerGuiNode     = playerNode.get_node("GUI")
		playerGuiNode.visible = true  
		visible               = false
		var cameraNode        = playerNode.get_node("Camera2D_player")
		cameraNode.current    = true
		return
	if Globals.cameraPlayer:
		Globals.cameraPlayer  = false
		var levelNode         = get_parent().get_parent()
		var levelGuiNode      = levelNode.get_node("GUI")
		levelGuiNode.visible  = true
		visible               = false
		var cameraNode        = levelNode.get_node("Camera2D")
		cameraNode.current    = true
		return
		
	pass # Replace with function body.


func _on_UP_button_down():
	Globals.up = true
	pass # Replace with function body.

func _on_UP_button_up():
	Globals.up = false
	pass # Replace with function body.

func _on_LEFT_button_down():
	Globals.left = true
	pass # Replace with function body.

func _on_LEFT_button_up():
	Globals.left = false
	pass # Replace with function body.

func _on_RIGHT_button_down():
	Globals.right = true
	pass # Replace with function body.
	
func _on_RIGHT_button_up():
	Globals.right = false
	pass # Replace with function body.

func _on_SHOOT_button_down():
	Globals.shoot = true
	pass # Replace with function body.

func _on_SHOOT_button_up():
	Globals.shoot = false
	pass # Replace with function body.
