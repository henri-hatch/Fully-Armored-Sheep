extends Control


func _ready():
	MusicPlayer.play_song("mainMenuMusic")


func _on_play_pressed():
	MusicPlayer.play_song("openingCutsceneMusic")
	Dialogic.start("openingCutscene")


func _on_options_pressed():
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
