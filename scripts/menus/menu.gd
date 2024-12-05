extends Control


func _ready():
	GlobalVariables.current_scene = get_tree().current_scene.scene_file_path
	if GlobalVariables.current_song != "mainMenuMusic":
		MusicPlayer.play_song("mainMenuMusic")
		GlobalVariables.current_song == "mainMenuMusic"


func _on_play_pressed():
	MusicPlayer.play_song("openingCutsceneMusic")
	Dialogic.start("openingCutscene")


func _on_options_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/optionsMenu.tscn")


func _on_quit_pressed():
	get_tree().quit()
