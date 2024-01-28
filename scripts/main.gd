extends Node


@export var main_menu : NodePath
@onready var main_menu_node : Control = get_node(main_menu)

@export var level_manager : NodePath
@onready var level_manager_node : LevelManager = get_node(level_manager)

# Called when the node enters the scene tree for the first time.$MainMenu
func _ready():


	var play_level_button : PlayButton = $MainMenu/MarginContainer/VBoxContainer/ButtonContainer/PlayButton
	var continue_level_button: ContinueButton = $MainMenu/MarginContainer/VBoxContainer/ButtonContainer/ContinueButton
	var quit_level_button: QuitButton = $MainMenu/MarginContainer/VBoxContainer/ButtonContainer/QuitButton

	play_level_button.play_level_button_pressed.connect(_on_play_level_button_pressed)
	quit_level_button.quit_button_pressed.connect(_on_quit_button_pressed)

func _on_play_level_button_pressed():
	main_menu_node.set_visible(false)
	level_manager_node.load_level(0)

func _on_quit_button_pressed():
	get_tree().quit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
