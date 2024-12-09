extends DialogicBackground

@onready var slothAnim = $Sloth/AnimationPlayer
@onready var gluttonyAnim = $Gluttony/AnimationPlayer
@onready var slothHealth = $Sloth/healthbar

func _ready():
	slothHealth.visible = false
	slothAnim.play("idleRight")
	gluttonyAnim.play("idleLeft")
