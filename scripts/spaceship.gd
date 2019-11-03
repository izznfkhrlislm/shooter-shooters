extends Area2D

func _ready():
	set_process(true)
	pass

func _process(delta):
	var motion = (utils.mouse_pos.x - position.x) * 0.2
	translate(Vector2(motion, 0))
	
	var pos = position
	pos.x = clamp(pos.x, 0+16, utils.view_size.x-16)
	position = pos
	
	pass
	