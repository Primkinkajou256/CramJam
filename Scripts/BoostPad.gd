extends Area2D

@export var boost_speed = 20
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for body in get_overlapping_bodies():
		if body is Rocket:
			# "rotation" is boost pad's direction
			body.linear_velocity += -Vector2(0, 1).rotated(body.rotation) * boost_speed
