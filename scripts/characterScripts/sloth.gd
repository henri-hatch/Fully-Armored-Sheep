extends CharacterBody2D

var speed = 100
var player_chase = false
var player = null
var max_health = 200
var health = max_health
var player_inattack_zone = false
var player_in_zone = false
var can_take_damage = true
var attacking = false


func _physics_process(delta):
	deal_with_damage()
	update_health()
	if GlobalVariables.characters_can_move == true:
		if player_chase:
			position += (player.position - position)/speed
			if attacking == true:
				$AnimatedSprite2D.play("attackRight")
				end_attack()
			else:
				if attacking == false:
					$AnimatedSprite2D.play("walkRight")
			
					if(player.position.x - position.x) < 0:
						$AnimatedSprite2D.flip_h = true
					else:
						$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.play("idleLeft")
	move_and_slide()
func enemy():
	pass


func _on_detection_area_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.has_method("player"):
		player=body
		player_chase=true


func _on_detection_area_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.has_method("player"):
		player=null
		player_chase=false
	

func _on_enemy_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_zone = true
		attacking = true
		
func end_attack():
	await $AnimatedSprite2D.animation_finished
	if(player.position.x - position.x) < 0:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
	if player_in_zone == true:
		GlobalVariables.enemy_attack = true
		GlobalVariables.attack_amount = 40
		attacking = true
	else:
		attacking = false


func _on_enemy_hitbox_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_zone = false


func deal_with_damage():
	if player_inattack_zone and GlobalVariables.player_current_attack == true:
		if can_take_damage == true:
			health -= 20
			$damage_cooldown.start()
			can_take_damage = false
			if health <= 0:
				$AnimatedSprite2D.play("death")
				self.queue_free()
				GlobalVariables.slothAlive = false
				GlobalVariables.checkSGBattleWon()


func _on_damage_cooldown_timeout() -> void:
	can_take_damage = true
	
	
func update_health():
	var healthbar = $healthbar
	healthbar.value = health
	if health >= max_health:
		healthbar.visible = false
	else:
		healthbar.visible = true


func _on_enemy_hurtbox_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_inattack_zone = true


func _on_enemy_hurtbox_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_inattack_zone = false
