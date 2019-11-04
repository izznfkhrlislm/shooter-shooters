extends Area2D

var lives = 4 setget set_lives
const laser_scene = preload("res://scenes/laser-ship.tscn")
const red_flash_scene = preload("res://scenes/red-flash.tscn")

signal lives_changed

func _ready():
	set_process(true)
	add_to_group("ship")
	
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

func set_lives(new_value):
	if new_value < lives:
		utils.main_node.add_child(red_flash_scene.instance())
		
	lives = new_value
	emit_signal("lives_changed", lives)
	
	if lives <= 0:
		queue_free()
	pass