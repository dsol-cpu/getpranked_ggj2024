extends Node
class_name LevelManager

@export var player : NodePath
@onready var player_node : Player = get_node(player)

@export var prank_task_ui : NodePath
@onready var prank_task_ui_node : PrankTaskUI = get_node(prank_task_ui)

var level_list = []
var current_level : int

# Called when the node enters the scene tree for the first time.
func _ready():
	#Load the levels into the level managers
	for level in get_children():
		if level is Level:
			level_list.append(level)

func load_level(level_num : int):
	current_level = level_num
	var spawn_position : Vector3 = level_list[level_num].get_spawn_position()
	player_node.set_position(spawn_position)
	player_node.set_level_active(true)
	level_list[level_num].set_visible(true)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	prank_task_ui_node.load_tasks(level_num)
	
	# assign prank task
	# make task UI visible
	# give it the tasks and populate the UI
	# 
	
func next_level():
	var level_num : int
	level_num = current_level + 1
	load_level(level_num)		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
