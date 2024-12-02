extends CharacterBody2D

var speed = 70
var player_chase = false
var player = null
var health = 40
var player_inattack_zone = false
var can_take_damage = true
func _physics_process(delta):
	deal_with_damage()
	update_health()
	if GlobalVariables.characters_can_move == true:
		if player_chase:
			position += (player.position - position)/speed
			if player_inattack_zone == true:
				$AnimatedSprite2D.play("Attack")
				if(player.position.x - position.x) < 0:
					$AnimatedSprite2D.flip_h = true
				else:
					$AnimatedSprite2D.flip_h = false
			else:
				$AnimatedSprite2D.play("Right")
			
				if(player.position.x - position.x) < 0:
					$AnimatedSprite2D.flip_h = true
				else:
					$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.play("RightIdle")
func _on_detection_area_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	player=body
	player_chase=true


func _on_detection_area_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	player=null
	player_chase=false

func enemy():
	pass


func _on_enemy_hitbox_body_entered(body: Node2D):
	if body.has_method("player"):
		player_inattack_zone = true


func _on_enemy_hitbox_body_exited(body: Node2D):
	if body.has_method("player"):
		player_inattack_zone = false
		
		
func deal_with_damage():
	if player_inattack_zone and GlobalVariables.player_current_attack == true:
		if can_take_damage == true:
			health -= 20
			$damage_cooldown.start()
			can_take_damage = false
			print("Snake health = ", health)
			if health <= 0:
				$AnimatedSprite2D.play("death")
				self.queue_free()


func _on_damage_cooldown_timeout() -> void:
	can_take_damage = true


func update_health():
	var healthbar = $healthbar
	healthbar.value = health
	if health >= 40:
		healthbar.visible = false
	else:
		healthbar.visible = true
