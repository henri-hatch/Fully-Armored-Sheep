extends CharacterBody2D


var speed = 50
@onready var animated_sprite = $AnimatedSprite2D


func _physics_process(delta):
	animated_sprite.play("idle")
	
	move_and_slide()
