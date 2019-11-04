extends "res://scripts/enemy.gd"

const laser_scene = preload("res://scenes/laser-enemy.tscn")

func _ready():
	velocity.x = utils.choose([velocity.x, -velocity.x])
	yield(utils.create_timer(1), "timeout")
	enemy_shoot()
	pass

func _process(delta):
	if position.x <= 0+16:
		velocity.x = abs(velocity.x)
	if position.x >= utils.view_size.x - 16:
		velocity.x = -abs(velocity.x)
	pass
	
func enemy_shoot():
	while true:
		var enemy_laser = laser_scene.instance()
		enemy_laser.position = get_node("enemy-weapon").global_position
		utils.main_node.add_child(enemy_laser)
		yield(utils.create_timer(1.5), "timeout")
	pass
