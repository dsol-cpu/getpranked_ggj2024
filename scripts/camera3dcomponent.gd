extends Node3D

@export var spring_arm : NodePath
@onready var spring_arm_node : SpringArm3D = get_node(spring_arm)

@export  var camera3d : NodePath
@onready var camera3d_node : Camera3D = get_node(camera3d)

var spring_arm_target_length : float = 2.0
var camera_distance_min : float =  1.0
var camera_distance_max : float = 6.0
var camera_zoom_step : float = 0.2 
var camera_lerp_speed : float =  5.0 

const ZOOM_FACTOR = 0.1 

var lerp_value : float =  0.005

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if(Input.get_mouse_mode() == Input.MOUSE_MODE_HIDDEN):
		if Input.is_action_just_pressed("camera_zoom_in") :
			zoom_in()
		elif Input.is_action_just_pressed("camera_zoom_out"):
			zoom_out()
			
func zoom_in():
	spring_arm_target_length -= camera_zoom_step
	spring_arm_target_length = clampf(spring_arm_target_length, camera_distance_min, camera_distance_max)

func zoom_out():
	spring_arm_target_length += camera_zoom_step
	spring_arm_target_length = clampf(spring_arm_target_length, camera_distance_min, camera_distance_max)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
