extends DialogicBackground

@onready var slothAnim = $Sloth/AnimationPlayer
@onready var gluttonyAnim = $Gluttony/AnimationPlayer


func _ready():
	slothAnim.play("idleRight")
	gluttonyAnim.play("idleLeft")
