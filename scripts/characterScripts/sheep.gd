extends CharacterBody2D

var enemy_inattack_range = false
var hitstun_cooldown = true
var health = 100
var max_health = 100
var speed = 100
var direction = Vector2.ZERO
var lastAnimDir: String = "Down"
var isAttacking: bool = false
var current_dir = ""
@onready var sheepAnim = $AnimationPlayer
@onready var weapon = $Weapon

func _physics_process(delta):
	enemy_attack()
	attack()
	update_health()
		
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
			SfxPlayer.swordSwoosh()
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
	pass


func _on_player_hitbox_body_exited(body: Node2D) -> void:
	pass
	
	
func enemy_attack():
	if health > 0:
		if enemy_inattack_range and hitstun_cooldown == true and GlobalVariables.enemy_attack == true:
			health -= GlobalVariables.attack_amount
			SfxPlayer.hurt()
			hitstun_cooldown = false
			GlobalVariables.enemy_attack = false
			$hit_stun.start()
	else:
		GlobalVariables.gameOver()

func _on_hit_stun_timeout() -> void:
	hitstun_cooldown = true

func attack():
	var dir = current_dir
	if Input.is_action_just_pressed("attack"):
		GlobalVariables.player_current_attack = true
		$attack_timer.start()


func _on_attack_timer_timeout() -> void:
	$attack_timer.stop()
	GlobalVariables.player_current_attack = false


func update_health():
	var healthbar = $healthbar
	healthbar.value = health
	if health >= max_health:
		healthbar.visible = false
	else:
		healthbar.visible = true
	
	
func _on_regen_timeout() -> void:
	if health < max_health:
		health += 20
		if health > max_health:
			health = 100
	if health <= 0:
		health = 0


func _on_player_hurtbox_body_entered(body: Node2D) -> void:
	if body.has_method("enemy"):
		enemy_inattack_range = true


func _on_player_hurtbox_body_exited(body: Node2D) -> void:
	if body.has_method("enemy"):
		enemy_inattack_range = false
