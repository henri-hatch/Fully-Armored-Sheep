extends CharacterBody2D

var speed = 100
var direction = Vector2.ZERO
var lastAnimDir: String = "Down"
var isAttacking: bool = false
@onready var sheepAnim = $AnimationPlayer
@onready var weapon = $Weapon

func _physics_process(delta):
	if GlobalVariables.player_can_move:
		if not isAttacking:
			# Handle walking speed
			if Input.is_action_pressed("walk"):
				speed = 50
			else:
				speed = 100
			
			# Handle movement input
			var playerDirection = Input.get_vector("left", "right", "up", "down")
			velocity = playerDirection * speed
			
			# Update movement animation
			if playerDirection != direction:
				if playerDirection.x > 0:
					sheepAnim.play("walkRight")
					lastAnimDir = "Right"
				elif playerDirection.x < 0:
					sheepAnim.play("walkLeft")
					lastAnimDir = "Left"
				elif playerDirection.y > 0:
					sheepAnim.play("walkDown")
					lastAnimDir = "Down"
				elif playerDirection.y < 0:
					sheepAnim.play("walkUp")
					lastAnimDir = "Up"
			elif playerDirection == direction:
				sheepAnim.stop()
		
		# Attack input
		if Input.is_action_just_pressed("attack") and not isAttacking:
			isAttacking = true
			sheepAnim.play("attack" + lastAnimDir)
			weapon.visible = true
			attack_animation_finished()
		
		move_and_slide()

# Coroutine to reset attack state
func attack_animation_finished():
	await sheepAnim.animation_finished
	isAttacking = false
	weapon.visible = false
