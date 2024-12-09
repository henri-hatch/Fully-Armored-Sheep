extends Area2D

var entered = false

func _ready():
	GlobalVariables.confirmLeave.connect(fromIdlehavenBattleToTraining)


func _on_scene_trigger_body_entered(body: PhysicsBody2D):
	if body.name == "Sheep":
		entered = true


func fromIdlehavenBattleToTraining():
	get_tree().change_scene_to_file("res://scenes/trainingGrounds.tscn")


func _process(delta):
	if entered:
		if GlobalVariables.current_scene == "res://scenes/idlehavenRestored.tscn": #still need to add trigger to idlehavenRestored scene
			#change coords
			get_tree().change_scene_to_file("res://scenes/trainingGrounds.tscn")
		elif GlobalVariables.current_scene == "res://scenes/main.tscn":
			GlobalVariables.coords = Vector2(337, 605)
			get_tree().change_scene_to_file("res://scenes/trainingGrounds.tscn")
