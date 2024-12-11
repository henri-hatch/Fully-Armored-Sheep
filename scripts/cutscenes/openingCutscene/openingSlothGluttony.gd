extends DialogicBackground

@onready var slothAnim = $Sloth/AnimationPlayer
@onready var gluttonyAnim = $Gluttony/AnimationPlayer
@onready var slothHealth = $Sloth/healthbar
@onready var gluttonyHealth = $Gluttony/healthbar

func _ready():
	slothHealth.visible = false
	gluttonyHealth.visible = false
	slothAnim.play("idleRight")
	gluttonyAnim.play("idleLeft")
