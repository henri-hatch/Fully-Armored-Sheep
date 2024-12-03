extends Node2D

@onready var shepherdAnim = $Shepherd/AnimationPlayer
@onready var sheep = $Sheep
@onready var sheepAnim = $Sheep/AnimationPlayer
@onready var fadeAnim = $FadeLayer/AnimationPlayer
@onready var pauseMenu = $Sheep/Camera2D/menuLayer/pauseMenu
@onready var gameOverMenu = $Sheep/Camera2D/menuLayer/gameOver


func _ready():
	if GlobalVariables.coords != Vector2():
		sheep.position = GlobalVariables.coords
		GlobalVariables.coords = Vector2()
		sheepAnim.play("up")
	pauseMenu.hide()
	gameOverMenu.hide()
	fadeAnim.play("fadeIn")
	if GlobalVariables.current_song != "fieldMusic":
		MusicPlayer.play_song("fieldMusic")
	GlobalVariables.player_can_move = true
	GlobalVariables.characters_can_move = true
	shepherdAnim.play("idle")
	
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		GlobalVariables.pause(pauseMenu)
		
