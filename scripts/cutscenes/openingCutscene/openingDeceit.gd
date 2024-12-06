extends DialogicBackground

@onready var deceitAnim = $Deceit/AnimationPlayer


func _ready():
	deceitAnim.play("idleLeft")
