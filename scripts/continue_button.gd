extends Button
class_name ContinueButton

signal continue_level_button_pressed

func _pressed():
	#Emit signal when button is pressed
	emit_signal("continue_level_button_pressed")
