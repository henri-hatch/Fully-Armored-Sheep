extends DialogicBackground

@onready var slothAnim = $Sloth/AnimationPlayer
@onready var health = $Sloth/healthbar


func _ready():
	health.visible =false
	slothAnim.play("sleepRight")
	SfxPlayer.slothSnore()
