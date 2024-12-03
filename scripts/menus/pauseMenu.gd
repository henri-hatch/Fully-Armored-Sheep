extends Control

@onready var main = $"res://scripts/main.gd"
@onready var trainingGrounds = $"res://scenes/trainingGrounds.tscn"


func _on_resume_pressed(scene_name):
	scene_name.pause()


func _on_options_pressed():
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
