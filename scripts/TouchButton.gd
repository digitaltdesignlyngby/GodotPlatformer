extends Button

signal _touch_down
signal _touch_up

var index ## til at holde øje med hvilket klik/touch der hører til knappen!

func _ready():
	pass # Replace with function body.



func _input(event):
	if event is InputEventScreenTouch:
		var xmin	=	rect_position.x
		var xmax	=	rect_position.x + rect_size.x
		var ymin	=	rect_position.y
		var ymax	=	rect_position.y + rect_size.y
		var x		=	event.position.x
		var y		=	event.position.y
		if x < xmax && x > xmin && y < ymax && y > ymin:
			if event.pressed  : 	## knappen klikkes og index huskes
				emit_signal("_touch_down")
				index = event.index
			if !event.pressed && event.index == index: ## hvis knappen slippes med dette index
				emit_signal("_touch_up")
			pass
