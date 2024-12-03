extends Node

@onready var sfx = $"sfxPlayer"


func swordSwoosh():
	sfx.stream = load("res://assets/soundEffects/sword_swoosh.mp3")
	sfx.play()
	
func hurt():
	sfx.stream = load("res://assets/soundEffects/hurt.mp3")
	sfx.play()
	
func gameOver():
	sfx.stream = load("res://assets/music/game_over.mp3")
	sfx.play()
