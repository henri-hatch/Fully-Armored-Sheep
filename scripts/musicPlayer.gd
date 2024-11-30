extends AudioStreamPlayer

@onready var dummy_player = AudioStreamPlayer.new()
var fading = false
var stopping = false


func _ready():
	add_child(dummy_player)


func _process(delta):
	if fading:
		volume_db -= 30 * delta
		dummy_player.volume_db += 30 * delta
		
		if dummy_player.volume_db >= 0:
			volume_db = 0
			dummy_player.volume_db = -60
			
			stream = dummy_player.stream
			play(dummy_player.get_playback_position())
			
			dummy_player.stop()
			fading = false
	
	if stop:
		volume_db -= 30 * delta
		if volume_db <= -60:
			stop_playback()
			stopping = false


func play_song(songName):
	dummy_player.stream = load(songName)
	dummy_player.volume_db = -60
	dummy_player.play()
	
	fading = true


func stop_song():
	stopping = true


func stop_playback():
	stop()
	volume_db = 0
	stream = null
