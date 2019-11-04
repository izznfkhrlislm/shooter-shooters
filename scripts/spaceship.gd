extends Area2D

const laser_scene = preload("res://scenes/laser-ship.tscn")

func _ready():
	set_process(true)
	yield(utils.create_timer(0.5), "timeout")
	shoot()
	pass

func _process(delta):
	var motion = (utils.mouse_pos.x - position.x) * 0.2
	translate(Vector2(motion, 0))
	
	var pos = position
	pos.x = clamp(pos.x, 0+16, utils.view_size.x-16)
	position = pos
	
	pass

func shoot():
	while true:
		var pos_left = get_node("weapon/weapon-position-left").global_position
		var pos_right = get_node("weapon/weapon-position-right").global_position
		create_laser(pos_left)
		create_laser(pos_right)
		yield(utils.create_timer(0.25), "timeout")
	pass

func create_laser(pos):
	var laser = laser_scene.instance()
	laser.position = pos
	utils.main_node.add_child(laser)
	pass
	