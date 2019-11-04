extends Area2D

export var lives = 2 setget set_lives
export var velocity = Vector2()

func _ready():
	set_process(true)
	add_to_group("enemies")
	pass # Replace with function body.

func _process(delta):
	translate(velocity * delta)
	if position.y-16 >= get_viewport_rect().size.y:
		queue_free()
	pass

func set_lives(new_value):
	lives = new_value
	if lives <= 0:
		queue_free()
	pass