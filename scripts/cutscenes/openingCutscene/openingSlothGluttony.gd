extends DialogicBackground

@onready var slothAnim = $Sloth/AnimatedSprite2D
@onready var gluttonyAnim = $Gluttony/AnimatedSprite2D


func _ready():
	slothAnim.play("idleRight")
	gluttonyAnim.play("idleLeft")
