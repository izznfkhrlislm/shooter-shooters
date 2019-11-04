extends Camera2D

var magnitude = 0
var shake_time = 0
var is_camera_shaking = false

func _ready():
	pass # Replace with function body.

func shake_camera(new_magnitude_val, shake_lifetime):
	if magnitude > new_magnitude_val:
		return
	
	magnitude = new_magnitude_val
	shake_time = shake_lifetime
	
	if is_camera_shaking:
		return
	is_camera_shaking = true
	
	while shake_time > 0:
		var shake_pos = Vector2()
		shake_pos.x = rand_range(-magnitude, magnitude)
		shake_pos.y = rand_range(-magnitude, magnitude)
		position = shake_pos
		
		shake_time -= get_process_delta_time()
		yield(get_tree(), "idle_frame")
	
	magnitude = 0
	is_camera_shaking = false
	position = Vector2(0,0)
	pass