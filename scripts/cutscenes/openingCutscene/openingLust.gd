extends DialogicBackground

@onready var lustAnim = $Lust/AnimationPlayer


func _ready():
	lustAnim.play("idleRight")
