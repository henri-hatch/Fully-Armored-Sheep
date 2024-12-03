extends Node

@onready var bg_music = $musicPlayer


func play_song(song_name):
	bg_music.play()
	var playback = bg_music.get_stream_playback() as AudioStreamPlaybackInteractive
	playback.switch_to_clip_by_name(song_name)
	GlobalVariables.current_song = song_name
	
	
func stop_song():
	bg_music.stop()
