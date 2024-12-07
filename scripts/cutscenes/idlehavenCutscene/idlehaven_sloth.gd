extends DialogicBackground

@onready var slothAnim = $Sloth/AnimationPlayer


func _ready():
	slothAnim.play("sleepRight")
	SfxPlayer.slothSnore()
