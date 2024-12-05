extends Node2D

@onready var sheepAnim = $Sheep/AnimationPlayer
@onready var pauseMenu = $Sheep/Camera2D/menuLayer/pauseMenu
@onready var pauseOptionsMenu = $Sheep/Camera2D/menuLayer/pauseOptionsMenu


# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVariables.current_scene = get_tree().current_scene.scene_file_path
	GlobalVariables.pauseOptionsPressed.connect(openPauseOptions)
	GlobalVariables.pauseOptionsBackPressed.connect(closePauseOptions)
	pauseMenu.hide()
	pauseOptionsMenu.hide()
	sheepAnim.play("right")
	if GlobalVariables.current_song != "bossMusic":
		MusicPlayer.play_song("bossMusic")


func openPauseOptions():
	if pauseMenu.is_visible_in_tree():
		pauseMenu.hide()
		pauseOptionsMenu.show()


func closePauseOptions():
	if pauseOptionsMenu.is_visible_in_tree():
		pauseOptionsMenu.hide()
		pauseMenu.show()


func _process(delta):
	if Input.is_action_just_pressed("pause"):
		GlobalVariables.pause(pauseMenu)
