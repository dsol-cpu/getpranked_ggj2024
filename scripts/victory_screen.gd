extends Control
class_name VictoryScreen

@export var game_music : NodePath
@onready var game_music_node: AudioStreamPlayer = get_node(game_music)

@export var victory_sound : NodePath
@onready var victory_sound_node : AudioStreamPlayer3D = get_node(victory_sound)

func victory_yay() -> void:
	game_music_node._set_playing(false)
	victory_sound_node._set_playing(true)
	set_visible(true)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
