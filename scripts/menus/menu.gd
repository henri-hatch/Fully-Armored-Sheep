extends Control

signal music_started

func _ready():
	MusicPlayer.play_song("res://assets/music/8-bit-main-menu.mp3")


func _on_play_pressed():
	Dialogic.start("openingCutscene")


func _on_options_pressed():
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
