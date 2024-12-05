extends Control


@onready var masterSlider = $MarginContainer/VBoxContainer/masterSlider
@onready var musicSlider = $MarginContainer/VBoxContainer/musicSlider
@onready var sfxSlider = $MarginContainer/VBoxContainer/sfxSlider


func _ready():
	masterSlider.value = db_to_linear(AudioServer.get_bus_volume_db(0))
	musicSlider.value = db_to_linear(AudioServer.get_bus_volume_db(1))
	sfxSlider.value = db_to_linear(AudioServer.get_bus_volume_db(2))
	
	
	GlobalVariables.current_scene = get_tree().current_scene.scene_file_path
	if GlobalVariables.current_song != "mainMenuMusic":
		MusicPlayer.play_song("mainMenuMusic")
		GlobalVariables.current_song == "mainMenuMusic"


func _on_master_slider_value_changed(value):
	AudioServer.set_bus_volume_db(0, linear_to_db(masterSlider.value))	


func _on_master_slider_mouse_exited():
	release_focus()


func _on_music_slider_value_changed(value):
	AudioServer.set_bus_volume_db(1, linear_to_db(musicSlider.value))
	
	

func _on_music_slider_mouse_exited():
	release_focus()


func _on_sfx_slider_value_changed(value):
	AudioServer.set_bus_volume_db(2, linear_to_db(sfxSlider.value))


func _on_sfx_slider_mouse_exited():
	release_focus()


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/menu.tscn")
