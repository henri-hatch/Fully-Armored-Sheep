extends DialogicBackground


@onready var gluttonyAnim = $Gluttony/AnimationPlayer

func _ready():
	gluttonyAnim.play("eatingLeft")
	SfxPlayer.gluttonyMunch()
	await get_tree().create_timer(4).timeout
	gluttonyAnim.play("surprisedLeft")
	SfxPlayer.gluttonyScream()
	await get_tree().create_timer(1).timeout
	gluttonyAnim.stop()
