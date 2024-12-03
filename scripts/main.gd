extends Node2D

@onready var shepherdAnim = $Shepherd/AnimationPlayer
@onready var sheepAnim = $Sheep/AnimationPlayer
@onready var fadeAnim = $FadeLayer/AnimationPlayer
@onready var pauseMenu = $Sheep/Camera2D/menuLayer/pauseMenu


func _ready():
	pauseMenu.hide()
	fadeAnim.play("fadeIn")
	MusicPlayer.play_song("res://assets/music/8-bit-field.mp3")
	GlobalVariables.player_can_move = true
	GlobalVariables.characters_can_move = true
	shepherdAnim.play("idle")
	sheepAnim.play("down")
	
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		GlobalVariables.pause(pauseMenu)
