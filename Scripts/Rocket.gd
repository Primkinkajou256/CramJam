extends CharacterBody2D

@export var accel = 1.0
@export var rotation_speed = 5.0
@export var fuel = 1.0 # Amount of fuel in seconds
@export var fuel_bar : TextureProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	fuel_bar.max_value = fuel
	fuel_bar.value = fuel


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Forward") and fuel > 0:
		velocity += Vector2(0, 1).rotated(rotation) * accel
		fuel -= delta
	if Input.is_action_pressed("TurnLeft"):
		rotation -= rotation_speed * delta
	if Input.is_action_pressed("TurnRight"):
		rotation += rotation_speed * delta
	
	move_and_slide()
	
	
	fuel_bar.value = fuel



