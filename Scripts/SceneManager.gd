extends Node

var current_scene = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func reset_level():
	load_scene(current_scene)

func next_scene():
	current_scene += 1
	load_scene(current_scene)
	

func load_scene(num = 0):
	var new_scene = load(get_scene_path(num)).instantiate()
	get_tree().get_root().get_child(1).queue_free()
	get_tree().get_root().add_child(new_scene)


func get_scene_path(num = 0):
	match num:
		0:
			return "res://Levels/Test Scene.tscn"
		1:
			return "res://Levels/Level 1.tscn"
		2:
			return "res://Levels/Level 2.tscn"
		3:
			return "res://Levels/Level 3.tscn"
		4:
			return "res://Levels/Level 4.tscn"
		5:
			return "res://Levels/Level 5.tscn"
		
		_:
			return "res://Levels/Credits.tscn"

