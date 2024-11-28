extends Node2D

@onready var shepherdAnim = $Shepherd/AnimationPlayer
@onready var sheepAnim = $Sheep/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVariables.player_can_move = true
	shepherdAnim.play("idle")
	sheepAnim.play("down")
