extends CharacterBody2D

var speed = 200
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	
	match str(direction):
		"(0, 1)":
			animated_sprite.frame = 0
		"(0, -1)":
			animated_sprite.frame = 1
		"(1, 0)":
			animated_sprite.frame = 2
		"(-1, 0)":
			animated_sprite.frame = 3
	
	move_and_slide()
