extends DialogicBackground

@onready var slothAnim = $Sloth/AnimatedSprite2D

func _ready():
	slothAnim.play("wakingRight")
	await get_tree().create_timer(3).timeout
	slothAnim.stop()
