extends CharacterBody2D


var speed = 50


func _physics_process(delta):
	
	move_and_slide()
