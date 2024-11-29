extends Control

@onready var main = $"res://scripts/main.gd"

func _on_resume_pressed():
	main.pause()


func _on_options_pressed():
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
