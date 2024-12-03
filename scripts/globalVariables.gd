extends Node

var player_can_move = false
var characters_can_move = false
var player_current_attack = false
var paused = false
var exiting_scene = false

func startGame():
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func pause(menu_path):
	if paused:
		menu_path.hide()
		GlobalVariables.player_can_move = true
		GlobalVariables.characters_can_move = true
		Engine.time_scale = 1
	else:
		menu_path.show()
		GlobalVariables.player_can_move = false
		GlobalVariables.characters_can_move = false
		Engine.time_scale = 0
		
	paused = !paused
