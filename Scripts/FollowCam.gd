extends Camera2D

@export var target : Node2D
@export var LR = true
@export var UD = true

var follow_offset = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	follow_offset = global_position - target.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if LR and target != null:
		global_position.x = target.global_position.x + follow_offset.x
	if UD and target != null:
		global_position.y = target.global_position.y + follow_offset.y
