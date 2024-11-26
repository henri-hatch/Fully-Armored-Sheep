extends CharacterBody2D

var speed = 100
var direction = Vector2.ZERO
var lastAnimDir: String = "Down"
var isAttacking: bool = false
@onready var animations = $AnimationPlayer
@onready var weapon = $Weapon


func _physics_process(delta):
	if GlobalVariables.player_can_move == true:
		if Input.is_action_pressed("walk"):
			speed = 50
		else:
			speed = 100
		
		var playerDirection = Input.get_vector("left", "right", "up", "down")
		velocity = playerDirection * speed
		
		if Input.is_action_pressed("attack"):
			animations.play("attack" + lastAnimDir)
			isAttacking = true
			weapon.visible = true
			await animations.animation_finished
			isAttacking = false
		
		if playerDirection != direction:
			if playerDirection.x > 0:
				animations.play("walkRight")
				lastAnimDir = "Right"
			elif playerDirection.x < 0:
				animations.play("walkLeft")
				lastAnimDir = "Left"
			elif playerDirection.y > 0:
				animations.play("walkDown")
				lastAnimDir = "Down"
			elif playerDirection.y < 0:
				animations.play("walkUp")
				lastAnimDir = "Up"
		elif playerDirection == direction:
			animations.stop()
			weapon.visible = false
		
		move_and_slide()
