extends DialogicBackground

@onready var slothAnim = $Sloth/AnimationPlayer
@onready var health = $Sloth/healthbar

func _ready():
	health.visible = false
	slothAnim.play("wakingRight")
	SfxPlayer.slothSnore()
	await get_tree().create_timer(1).timeout
	SfxPlayer.slothGrunt()
	await get_tree().create_timer(1.75).timeout
	slothAnim.play("idleRight")
