extends Button
class_name PlayButton

signal play_level_button_pressed

func _pressed():
	#Emit signal when button is pressed
	emit_signal("play_level_button_pressed")
