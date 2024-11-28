extends CharacterBody2D

var speed = 100
var direction = Vector2.ZERO
var lastAnimDir: String = "Down"
var isAttacking: bool = false
@onready var sheepAnim = $AnimationPlayer
@onready var weapon = $Weapon


func _physics_process(delta):
	if GlobalVariables.player_can_move == true:
		weapon.visible = false
		if Input.is_action_pressed("walk"):
			speed = 50
		else:
			speed = 100
		
		var playerDirection = Input.get_vector("left", "right", "up", "down")
		velocity = playerDirection * speed
		
		if Input.is_action_pressed("attack"):
			sheepAnim.play("attack" + lastAnimDir)
			isAttacking = true
			weapon.visible = true
			await sheepAnim.animation_finished
			isAttacking = false
		
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
			weapon.visible = false
		
		move_and_slide()
