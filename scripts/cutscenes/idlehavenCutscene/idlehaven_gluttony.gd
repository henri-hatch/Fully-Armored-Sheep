extends DialogicBackground


@onready var gluttonyAnim = $Gluttony/AnimatedSprite2D

func _ready():
	gluttonyAnim.play("eatingLeft")
	await get_tree().create_timer(4).timeout
	gluttonyAnim.play("idleLeft")
