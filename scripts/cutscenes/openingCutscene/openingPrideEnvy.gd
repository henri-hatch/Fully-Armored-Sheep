extends DialogicBackground

@onready var prideAnim = $Pride/AnimationPlayer


func _ready():
	prideAnim.play("idleRight")
