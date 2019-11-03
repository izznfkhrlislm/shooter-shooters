extends Node

const enemy_sprite = preload("res://scenes/enemy_1.tscn")

func _ready():
	spawnEnemy()
	pass # Replace with function body.

func spawnEnemy():
	while true:
		randomize()
		
		var newEnemy = enemy_sprite.instance()
		var newEnemyPosition = Vector2()
		
		newEnemyPosition.x = rand_range(0+16, utils.view_size.x-16)
		newEnemyPosition.y = 0-16
		newEnemy.position = newEnemyPosition
		
		get_node("enemy-container").add_child(newEnemy)
		yield(utils.create_timer(rand_range(1.0, 2.5)), "timeout")
	pass

#func _process(delta):
#	pass
