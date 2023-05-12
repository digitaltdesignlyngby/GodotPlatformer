extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


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
