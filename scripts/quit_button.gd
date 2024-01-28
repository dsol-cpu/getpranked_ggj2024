extends Button
class_name QuitButton

#signal quit_button_pressed

func _pressed():
	#Emit signal when button is pressed
	#emit_signal("quit_button_pressed")
	get_tree().quit()
