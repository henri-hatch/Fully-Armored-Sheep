extends DialogicBackground

@onready var slothAnim = $Sloth/AnimatedSprite2D

func _ready():
	slothAnim.play("wakingRight")
	SfxPlayer.slothSnore()
	await get_tree().create_timer(1).timeout
	SfxPlayer.slothGrunt()
	await get_tree().create_timer(1.75).timeout
	slothAnim.play("idleRight")
