extends CharacterBody2D

var enemy_inattack_range = false
var enemy_attack_cooldown = true
var health = 100
var player_alive = true
var speed = 100
var direction = Vector2.ZERO
var lastAnimDir: String = "Down"
var isAttacking: bool = false
var current_dir = "none"
@onready var sheepAnim = $AnimationPlayer
@onready var weapon = $Weapon

func _physics_process(delta):
	enemy_attack()
	attack()
	if health <= 0:
		player_alive = false #add end screen/death
		health = 0
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
					current_dir = "right"
				elif playerDirection.x < 0:
					sheepAnim.play("walkLeft")
					lastAnimDir = "Left"
					current_dir = "left"
				elif playerDirection.y > 0:
					sheepAnim.play("walkDown")
					lastAnimDir = "Down"
					current_dir = "down"
				elif playerDirection.y < 0:
					sheepAnim.play("walkUp")
					lastAnimDir = "Up"
					current_dir = "up"
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


func player():
	pass

func _on_player_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method("enemy"):
		enemy_inattack_range = true



func _on_player_hitbox_body_exited(body: Node2D) -> void:
	if body.has_method("enemy"):
		enemy_inattack_range = false
	
func enemy_attack():
	if enemy_inattack_range and enemy_attack_cooldown == true:
		health -= 20
		enemy_attack_cooldown = false
		$hit_stun.start()
		print(health)


func _on_hit_stun_timeout() -> void:
	enemy_attack_cooldown = true

func attack():
	var dir = current_dir
	if Input.is_action_just_pressed("attack"):
		GlobalVariables.player_current_attack = true
		$attack_timer.start()


func _on_attack_timer_timeout() -> void:
	$attack_timer.stop()
	GlobalVariables.player_current_attack = false
