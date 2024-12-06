extends Area2D


var entered = false

func _on_body_entered(body: PhysicsBody2D):
	if body.name == "Sheep":
		if !GlobalVariables.idlehavenCutscenePlayed:
			MusicPlayer.play_song("idlehavenMusic")
			print("music started")
			Dialogic.start("IdlehavenCutscene")
		else:
			entered = true


func _process(delta):
	if entered:
		get_tree().change_scene_to_file("res://scenes/bossArenas/idlehavenBossArena.tscn")
