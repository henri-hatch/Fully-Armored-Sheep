extends Area2D

var entered = false

func _on_scene_trigger_body_entered(body: PhysicsBody2D):
	if body.name == "Sheep":
		entered = true


func _process(delta):
	if entered:
		GlobalVariables.coords = Vector2(337, 605)
		get_tree().change_scene_to_file("res://scenes/trainingGrounds.tscn")
