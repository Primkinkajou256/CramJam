class_name Rocket extends RigidBody2D

@export var accel = 1.0
@export var rotation_speed = 5.0
@export var fuel = 1.0 # Amount of fuel in seconds
@export var fuel_bar : TextureProgressBar
@export var particles : CPUParticles2D
@export var RToRestartText : Label
@export var sound : AudioStreamPlayer2D
@export var explode_sound : AudioStreamPlayer2D
@export var anim : AnimationPlayer

var dead = false

# Called when the node enters the scene tree for the first time.
func _ready():
	sound.volume_db = -60
	fuel_bar.max_value = fuel
	fuel_bar.value = fuel


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _integrate_forces(state):
	if fuel <= 0:
		RToRestartText.visible = true
	particles.emitting = false
	if Input.is_action_pressed("Forward") and fuel > 0 and !dead:
		linear_velocity += -Vector2(0, 1).rotated(rotation) * accel
		fuel -= state.step
		particles.emitting = true
		sound.volume_db = lerpf(sound.volume_db, 0, .2)
	else:
		sound.volume_db = lerpf(sound.volume_db, -60, .02)
	angular_velocity = 0
	if Input.is_action_pressed("TurnLeft") and !dead:
		angular_velocity -= rotation_speed
	if Input.is_action_pressed("TurnRight") and !dead:
		angular_velocity += rotation_speed
	
	fuel_bar.value = fuel

	# Reset Level
	if Input.is_action_just_pressed("ResetLevel") and !dead:
		kill()

func reset_level():
	SceneManager.reset_level()

func kill():
	dead = true
	anim.play("kill")
	explode_sound.play()

