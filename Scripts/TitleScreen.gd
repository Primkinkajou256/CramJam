extends Node

var game_started = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Forward") && !game_started:
		%"Start Game Anim".play("Start")
		game_started = true
		SceneManager.start_timer()


func start_game():
	SceneManager.next_scene()

