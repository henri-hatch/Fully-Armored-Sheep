extends Node

@onready var sfx = $"sfxPlayer"


func swordSwoosh():
	sfx.stream = load("res://assets/soundEffects/sword_swoosh.mp3")
	sfx.volume_db = 0
	sfx.play()


func hurt():
	sfx.stream = load("res://assets/soundEffects/hurt.mp3")
	sfx.volume_db = -5
	sfx.play()


func gameOver():
	sfx.stream = load("res://assets/music/game_over.mp3")
	sfx.volume_db = 0
	sfx.play()


func slothSnore():
	sfx.stream = load("res://assets/soundEffects/snoring.mp3")
	sfx.volume_db = 15
	sfx.play()


func gluttonyMunch():
	sfx.stream = load("res://assets/soundEffects/munchin.mp3")
	sfx.volume_db = 0
	sfx.play()


func gluttonyScream():
	sfx.stream = load("res://assets/soundEffects/scream.mp3")
	sfx.volume_db = 0
	sfx.play()


func slothGrunt():
	sfx.stream = load("res://assets/soundEffects/grunt.mp3")
	sfx.volume_db = 0
	sfx.play()


func stop():
	sfx.stream = null
	sfx.stop()
