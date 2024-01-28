extends Control
class_name PrankTaskUI

@export var vbox_container : NodePath
@onready var vbox_container_node : VBoxContainer = get_node(vbox_container)

@export var checkbox : NodePath
@onready var checkbox_node : CheckBox = get_node(checkbox)

@export var level_manager : NodePath
@onready var level_manager_node : LevelManager = get_node(level_manager)

var prank_list = [["Smack the milk bottle", "Goodbye grill"], ["Knock over the lamp"], ["Break the bed", "Sleep"]]

var prank_object_list = [[]]
	
	
func load_tasks(level_num : int):
	set_visible(true)
	for prank in prank_list[level_num]:
		vbox_container_node.add_child(checkbox_node.duplicate())
		checkbox_node.set_visible(true)
		checkbox_node.set_text(prank)
		
		prank_object_list.clear()
		
	
# Called when the node enters the scene tree for the first time.


func _ready():
	

	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
