extends Area2D

@export var sound : AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for body in get_overlapping_bodies():
		if body is RopeSegment:
			var next_body = body
			while next_body.next_segment != null:
				var temp_body = next_body.next_segment
				next_body.queue_free()
				next_body = temp_body
			next_body.queue_free()
			sound.play()


