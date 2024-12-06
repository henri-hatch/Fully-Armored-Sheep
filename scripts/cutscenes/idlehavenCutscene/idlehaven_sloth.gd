extends DialogicBackground

@onready var slothAnim = $Sloth/AnimatedSprite2D


func _ready():
	slothAnim.play("sleepRight")
	SfxPlayer.slothSnore()
