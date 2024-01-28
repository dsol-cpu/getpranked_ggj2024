extends Control
class_name PrankTaskUI

@export var vbox_container : NodePath
@onready var vbox_container_node : VBoxContainer = get_node(vbox_container)

@export var prank_task_element : NodePath
@onready var prank_task_element_node : PrankTaskElement = get_node(prank_task_element)

var prank_list = [["Smack the milk bottle"], ["Knock over the lamp"], ["Break the bed", "Sleep"]]

func load_tasks(level_num : int):
	for prank in prank_list[level_num]:
		vbox_container_node.add_child(prank_task_element_node.duplicate())
		prank_task_element_node.set_visible(true)
		var label : Label = prank_task_element_node.get_child(1)
		label.set_text(prank)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
