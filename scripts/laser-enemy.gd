extends "res://scripts/laser.gd"

func _ready():
	connect("area_entered", self, "_on_area_entered")
	pass # Replace with function body.

func _on_area_entered(other_area):
	if other_area.is_in_group("ship"):
		other_area.lives -= 1
		create_flare()
		utils.remote_call("world-node-camera", "shake_camera", 8, 0.13)
		queue_free()
	pass
