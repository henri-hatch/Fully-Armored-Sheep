extends Node2D

@onready var slothAnim = $Sloth/AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	slothAnim.play("idleRight")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
