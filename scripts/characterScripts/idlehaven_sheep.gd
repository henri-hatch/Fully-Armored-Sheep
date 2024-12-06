extends CharacterBody2D

@onready var idlehavenSheepAnim = $AnimatedSprite2D

func _ready():
	idlehavenSheepAnim.play("tired")
