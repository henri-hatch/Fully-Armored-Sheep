extends Node2D

@onready var pauseMenu = $Sheep/Camera2D/menuLayer/pauseMenu
@onready var pauseOptionsMenu = $Sheep/Camera2D/menuLayer/pauseOptionsMenu
@onready var fadeAnim = $FadeLayer/AnimationPlayer
@onready var signText = $SignText
@onready var signAnim = $SignText/AnimationPlayer
var signRadiusEntered = false

func _ready():
	GlobalVariables.current_scene = get_tree().current_scene.scene_file_path
	GlobalVariables.pauseOptionsPressed.connect(openPauseOptions)
	GlobalVariables.pauseOptionsBackPressed.connect(closePauseOptions)
	GlobalVariables.player_can_move = true
	GlobalVariables.characters_can_move = true
	pauseMenu.hide()
	pauseOptionsMenu.hide()
	fadeAnim.play("fadeIn")
	if GlobalVariables.current_song != "fieldMusic":
		MusicPlayer.play_song("fieldMusic")


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
	if signRadiusEntered:
		signText.visible = true
		signAnim.play("hover")
	else:
		signText.visible = false
		signAnim.stop()


func _on_sign_radius_body_entered(body: PhysicsBody2D):
	if body.name == "Sheep":
		signRadiusEntered = true


func _on_sign_radius_body_exited(body: PhysicsBody2D):
	if body.name == "Sheep":
		signRadiusEntered = false
