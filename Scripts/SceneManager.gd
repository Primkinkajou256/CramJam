extends Node

var current_scene = 0
@onready var ambient_noise = AudioStreamPlayer.new()
@onready var timer_text = Label.new()
@onready var timer_canvas = CanvasLayer.new()
@onready var timer_cam = Camera2D.new()
var timer = 0.0
var timing = false

# Called when the node enters the scene tree for the first time.
func _ready():
	ambient_noise.stream = preload("res://Sounds/SpaceAmbiant.mp3")
	add_child.call_deferred(ambient_noise)
	ambient_noise.play.call_deferred()
	
	get_viewport().add_child.call_deferred(timer_canvas)
	get_viewport().move_child.call_deferred(timer_canvas,  0)
	timer_canvas.add_child.call_deferred(timer_text)
	

func start_timer():
	timing = true

func stop_timer():
	timing = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timing:
		timer += delta
		var rounded_timer = roundf(timer * 100) / 100
		timer_text.text = str(rounded_timer)

func reset_level():
	load_scene(current_scene)

func next_scene():
	current_scene += 1
	load_scene(current_scene)
	

func load_scene(num = 0):
	var new_scene = load(get_scene_path(num)).instantiate()
	get_tree().get_root().get_child(2).queue_free()
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
		6:
			return "res://Levels/Level 6.tscn"
		7:
			return "res://Levels/Level 7.tscn"
		8:
			return "res://Levels/Level 8.tscn"
		
		_:
			return "res://Levels/Credits.tscn"

