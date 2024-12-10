extends Node


var player_alive = true
var player_can_move = false
var characters_can_move = false
var player_current_attack = false
var enemy_attack = false
var attack_amount = 0
var paused = false
var exiting_scene = false
var current_song = ""
var current_scene = ""
var openingCutscenePlayed = false
var idlehavenCutscenePlayed = false
var slothAlive = true
var gluttonyAlive = true
var idlehavenBattleWon = false
var shoesOfReadiness = false
var coords = Vector2()

signal pauseOptionsPressed
signal pauseOptionsBackPressed
signal leaveMenuTriggered
signal leaveMenuClosed
signal confirmLeave


func startGame():
	if openingCutscenePlayed == false:
		openingCutscenePlayed = true
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func startSlothGluttonyBattle():
	if idlehavenCutscenePlayed == false:
		idlehavenCutscenePlayed = true
	get_tree().change_scene_to_file("res://scenes/bossArenas/idlehavenBossArena.tscn")


func endShoesCutscene():
	shoesOfReadiness = true
	get_tree().change_scene_to_file("res://scenes/idlehavenRestored.tscn")


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
		player_can_move = false
		characters_can_move = false
		Engine.time_scale = 0
		MusicPlayer.play_song("gameOver")
		get_tree().change_scene_to_file("res://scenes/menus/gameOver.tscn")


func respawn():
	player_alive = true
	player_can_move = true
	characters_can_move = true
	Engine.time_scale = 1
	coords = Vector2()
