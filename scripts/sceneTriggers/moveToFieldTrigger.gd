extends Area2D

var entered = false
signal fromTrainingGrounds

func _on_body_entered(body: PhysicsBody2D):
	if body.name == "Sheep":
		entered = true


func _process(delta):
	if entered:
		emit_signal("fromTrainingGrounds")
		get_tree().change_scene_to_file("res://scenes/main.tscn")
