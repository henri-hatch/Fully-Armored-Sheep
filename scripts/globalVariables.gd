extends Node

var player_can_move = false
var characters_can_move = false

func startGame():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
