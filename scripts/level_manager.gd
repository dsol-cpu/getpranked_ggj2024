extends Node
class_name LevelManager

@export var player : NodePath
@onready var player_node : Player = get_node(player)

@export var prank_task_ui : NodePath
@onready var prank_task_ui_node : PrankTaskUI = get_node(prank_task_ui)

@export var victory_screen : NodePath
@onready var victory_screen_node : VictoryScreen = get_node(victory_screen)

var level_list = []
var level_prank_object_list = []
var current_level : int

# Called when the node enters the scene tree for the first time.
func _ready():
	#Load the levels into the level managers
	for level in get_children():
		if level is Level:
			level_list.append(level)
			level.object_broken_notif.connect(_check_off_box)
			if len(level.get_prank_object_list()) != 0:
				level_prank_object_list.append(level.get_prank_object_list())
		print(level_prank_object_list)
			

func load_level(level_num : int):
	current_level = level_num
	var spawn_position : Vector3 = level_list[level_num].get_spawn_position()
	player_node.set_position(spawn_position)
	player_node.set_level_active(true)
	level_list[level_num].set_visible(true)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	# assign prank task
	# make task UI visible
	# give it the tasks and populate the UI 
	prank_task_ui_node.set_visible(true)
	prank_task_ui_node.load_tasks(level_num)
	
func next_level():
	var level_num : int
	level_num = current_level + 1
	load_level(level_num)		
	

func _check_off_box(node_name: String):
	var counter: int = 0

	for i in len(level_prank_object_list[current_level])-1:
		if level_prank_object_list[current_level][i] == node_name:
			for node in prank_task_ui_node.vbox_container_node.get_children():
				if node is CheckBox and counter == i:
					node.button_pressed = true
				else:
					counter+=1
			for node in prank_task_ui_node.vbox_container_node.get_children():
				if node is CheckBox and node.button_pressed:
					victory_screen_node.victory_yay()
		break
			
			

func _process(_delta):
	pass
	#if len(level_prank_object_list[current_level]) != len(level_list[current_level].get_prank_object_list()):
		#var process_by_elim_list = []
		#process_by_elim_list = level_prank_object_list[current_level]
		#for n in len(level_list[current_level].get_prank_object_list())-1:
			#if process_by_elim_list[n] == level_list[current_level].get_prank_object_list()[n]:
				#process_by_elim_list.remove()
			
	# when an item disappears, it will make the length smaller
	# to detect which item disappeared, we can guess which one isn't in our list
	# get index of that in our list
	# tell prank_task_ui to check the box in that index
		
		
