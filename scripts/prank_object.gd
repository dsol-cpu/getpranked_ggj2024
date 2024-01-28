extends Node3D
class_name PrankObject

var is_primed : bool = false
var countdown_started : bool = false
var countdown_timer : float

@export var interaction_area_3d : NodePath
@onready var interaction_area_3d_node : Area3D = get_node(interaction_area_3d)

@export var sound_effect : NodePath
@onready var sound_effect_node : AudioStreamPlayer3D = get_node(sound_effect)

signal object_brokey(name)

# Called when the node enters the scene tree for the first time.
func _ready():
	interaction_area_3d_node.body_entered.connect(_on_body_entered)
	interaction_area_3d_node.body_exited.connect(_on_body_exited)
	
func _on_body_entered(body):
	if body.is_in_group("Player"):
		is_primed = true
		
func _on_body_exited(body):
	if body.is_in_group("Player"):
		is_primed = false

func _process(delta):
	if Input.is_action_just_pressed("interact") and is_primed:
		countdown_started = true
		sound_effect_node.play()
		object_brokey.emit(name)
		
	if countdown_started:
		countdown_timer += delta
		if countdown_timer >= 0.6:
			queue_free()
