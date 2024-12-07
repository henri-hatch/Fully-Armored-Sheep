extends DialogicBackground

@onready var prideAnim = $Pride/AnimationPlayer
@onready var envyAnim = $Envy/AnimationPlayer


func _ready():
	prideAnim.play("idleRight")
	envyAnim.play("idleLeft")
