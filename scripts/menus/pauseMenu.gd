extends Control


func _on_resume_pressed():
	var escape_event = InputEventKey.new()
	escape_event.keycode = KEY_ESCAPE
	escape_event.pressed = true
	Input.parse_input_event(escape_event)
	
	var release_event = InputEventKey.new()
	release_event.keycode = KEY_ESCAPE
	release_event.pressed = false
	Input.parse_input_event(release_event)


func _on_options_pressed():
	GlobalVariables.pauseOptionsPressed.emit()


func _on_quit_pressed():
	get_tree().quit()
