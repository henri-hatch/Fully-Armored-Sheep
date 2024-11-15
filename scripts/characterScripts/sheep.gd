extends CharacterBody2D

var speed = 100
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	if GlobalVariables.player_can_move == true:
		if Input.is_action_pressed("walk"):
			speed = 50
		else:
			speed = 100
		
		var direction = Input.get_vector("left", "right", "up", "down")
		velocity = direction * speed
		
		if direction != Vector2.ZERO:
			if direction.x > 0:
				animated_sprite.play("WalkRight")
			elif direction.x < 0:
				animated_sprite.play("WalkLeft")
			elif direction.y > 0:
				animated_sprite.play("WalkDown")
			elif direction.y < 0:
				animated_sprite.play("WalkUp")
		elif direction == Vector2.ZERO:
			animated_sprite.frame = 1
		
		move_and_slide()
