extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for body in get_overlapping_bodies():
		if body is Ball:
			print("Victory!")
			SceneManager.next_scene()





func _on_body_entered(body):
	pass # Replace with function body.
