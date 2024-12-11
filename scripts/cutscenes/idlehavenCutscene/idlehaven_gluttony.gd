extends DialogicBackground


@onready var gluttonyAnim = $Gluttony/AnimationPlayer
@onready var health = $Gluttony/healthbar

func _ready():
	health.visible = false
	gluttonyAnim.play("eatingLeft")
	SfxPlayer.gluttonyMunch()
	await get_tree().create_timer(4).timeout
	gluttonyAnim.play("surprisedLeft")
	SfxPlayer.gluttonyScream()
	await get_tree().create_timer(1).timeout
	gluttonyAnim.stop()
