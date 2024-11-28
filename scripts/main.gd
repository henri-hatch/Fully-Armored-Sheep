extends Node2D

@onready var shepherdAnim = $Shepherd/AnimationPlayer
@onready var sheepAnim = $Sheep/AnimationPlayer
@onready var canvasAnim = $CanvasLayer/AnimationPlayer
@onready var pauseMenu = $Sheep/Camera2D/pauseMenu
var paused = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pauseMenu.hide()
	canvasAnim.play("fadeIn")
	GlobalVariables.player_can_move = true
	shepherdAnim.play("idle")
	sheepAnim.play("down")
	
func _process(delta):
	if Input.is_action_pressed("pause"):
		pause()

func pause():
	if paused:
		pauseMenu.hide()
		Engine.time_scale = 1
	else:
		pauseMenu.show()
		Engine.time_scale = 0
	
	paused = !paused
