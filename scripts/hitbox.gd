class_name Hitbox
extends Area2D

@export var damage := 10

# Called when the node enters the scene tree for the first time.
func _init() -> void:
	collision_layer = 4
	collision_mask = 0
