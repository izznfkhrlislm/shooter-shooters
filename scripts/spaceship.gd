extends Area2D

func _ready():
	set_process(true)
	pass

func _process(delta):
	var motion = (get_global_mouse_position().x - position.x) * 0.2
	translate(Vector2(motion, 0))
	
	var view_size = get_viewport_rect().size
	var pos = position
	pos.x = clamp(pos.x, 0+16, view_size.x-16)
	position = pos
	
	pass
	