extends Node

var player_alive = true
var player_can_move = false
var characters_can_move = false
var player_current_attack = false
var paused = false
var exiting_scene = false
var current_song = ""
var openingCutscenePlayed = false
var coords = Vector2()

func startGame():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	

func pause(menu_path):
	if paused:
		menu_path.hide()
		player_can_move = true
		characters_can_move = true
		Engine.time_scale = 1
	else:
		menu_path.show()
		player_can_move = false
		characters_can_move = false
		Engine.time_scale = 0
		
	paused = !paused
	

func gameOver():
	if player_alive == true:
		player_alive = false
		MusicPlayer.play_song("gameOver")
		player_can_move = false
		characters_can_move = false
		Engine.time_scale = 0
		
		
func respawn():
	pass # set alive to true, engine time scale etc.
		
	
	
