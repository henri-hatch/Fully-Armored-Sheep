extends Node2D

@onready var shepherdAnim = $Shepherd/AnimationPlayer
@onready var sheepAnim = $Sheep/AnimationPlayer
@onready var fadeAnim = $FadeLayer/AnimationPlayer
@onready var pauseMenu = $Sheep/Camera2D/pauseMenu
var paused = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pauseMenu.hide()
	enterScene()
	MusicPlayer.play_song("res://assets/music/8-bit-field.mp3")
	GlobalVariables.player_can_move = true
	GlobalVariables.characters_can_move = true
	shepherdAnim.play("idle")
	sheepAnim.play("down")
	
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pause()
		
func enterScene():
	fadeAnim.play("fadeIn")

func exitScene():
	fadeAnim.play("fadeOut")

func pause():
	if paused:
		pauseMenu.hide()
		GlobalVariables.player_can_move = true
		GlobalVariables.characters_can_move = true
		Engine.time_scale = 1
	else:
		pauseMenu.show()
		GlobalVariables.player_can_move = false
		GlobalVariables.characters_can_move = false
		Engine.time_scale = 0
		
	paused = !paused

