extends CharacterBody3D
class_name Player

@export var driving_sound : NodePath
@onready var driving_sound_node : AudioStreamPlayer3D = get_node(driving_sound) 

const MOVE_LERP_VALUE : float = 0.5
var driving_sound_volume : float 
var level_active : bool = false

const WEIGHT = 1.1 
const SPEED = 35.0
const JUMP_VELOCITY = 8.5
const MOVING_SOUND_VOLUME_DB = 16.495

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
func set_level_active(activity : bool):
	level_active = activity
	
func _physics_process(delta):
	# Add the gravity.
	if(level_active):
		if not is_on_floor():
			velocity.y -= gravity * delta * WEIGHT

		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")

		var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		direction = direction.rotated(Vector3(0,1,0),-PI/4)
		
		if direction:
			if(!driving_sound_node.playing):
				driving_sound_node._set_playing(true)
				driving_sound_node.set_volume_db(MOVING_SOUND_VOLUME_DB)
			velocity.x = lerp(velocity.x, direction.x * SPEED, MOVE_LERP_VALUE)
			velocity.z = lerp(velocity.z, direction.z * SPEED, MOVE_LERP_VALUE)
			
		# set_rotation(Vector3(get_rotation().x,lerp_angle(get_rotation().y, atan2(velocity.x, velocity.z), MOVE_LERP_VALUE),	get_rotation().z))
		
		# TODO: SET ROTATION
	
		else:
			driving_sound_node.set_volume_db(lerp(driving_sound_node.get_volume_db(), 0.0, 0.05))
			velocity.x = lerp(velocity.x, 0.0, MOVE_LERP_VALUE)
			velocity.z = lerp(velocity.z, 0.0, MOVE_LERP_VALUE)
			
		if velocity.is_zero_approx():
			driving_sound_node._set_playing(false)		
			driving_sound_node.set_volume_db(0.0)

		move_and_slide()
