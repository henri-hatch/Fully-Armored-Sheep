extends Area2D

var damage = 10


func enemy():
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		GlobalVariables.enemy_attack = true
		GlobalVariables.attack_amount = damage
