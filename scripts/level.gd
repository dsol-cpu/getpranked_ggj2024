extends Node3D
class_name Level

# Called when the node enters the scene tree for the first time.
@export var spawn_position : Vector3

func _ready():
	pass # Replace with function body.

func get_spawn_position() -> Vector3:
	return spawn_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
