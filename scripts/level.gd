extends Node3D
class_name Level

var prank_object_list = []
# Called when the node enters the scene tree for the first time.
@export var spawn_position : Vector3

signal object_broken_notif 

func _ready():
	for object in get_children():
		if object is PrankObject:
			object.object_brokey.connect(_on_object_broken_notification)
			prank_object_list.append(object.name)

func _on_object_broken_notification(name_str: String)-> void:
	object_broken_notif.emit(name_str)
	
func get_prank_object_list():
	return prank_object_list

func get_spawn_position() -> Vector3:
	return spawn_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
