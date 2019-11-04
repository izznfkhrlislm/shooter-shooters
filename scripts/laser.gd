extends Area2D

export var velocity = Vector2()
const flare_scene = preload("res://scenes/flare.tscn")

func _ready():
	set_process(true)
	create_flare()
	
	yield(get_node("laser-visibility"), "screen_exited")
	queue_free()
	pass 

func _process(delta):
	translate(velocity * delta)
	pass

func create_flare():
	var flare = flare_scene.instance() 
	flare.position = position
	utils.main_node.add_child(flare)
	pass