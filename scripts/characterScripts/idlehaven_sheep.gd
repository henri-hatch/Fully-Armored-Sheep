extends CharacterBody2D

@onready var idlehavenSheepAnim = $AnimatedSprite2D

func _ready():
	await get_tree().create_timer(randf_range(0, 3)).timeout
	idlehavenSheepAnim.play("tired")
