extends Area2D

var damage = 10


func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.has_node("player_hitbox"):
		GlobalVariables.enemy_attack = true
		GlobalVariables.attack_amount = damage

func enemy():
	pass
