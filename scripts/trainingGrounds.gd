extends Node2D

@onready var pauseMenu = $Sheep/Camera2D/menuLayer/pauseMenu
@onready var fadeAnim = $FadeLayer/AnimationPlayer

func _ready():
	GlobalVariables.current_scene = get_tree().current_scene.scene_file_path
	pauseMenu.hide()
	fadeAnim.play("fadeIn")
	if GlobalVariables.current_song != "fieldMusic":
		MusicPlayer.play_song("fieldMusic")


func _process(delta):
	if Input.is_action_just_pressed("pause"):
		GlobalVariables.pause(pauseMenu)
