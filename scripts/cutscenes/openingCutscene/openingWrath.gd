extends DialogicBackground

@onready var wrathAnim = $Wrath/AnimationPlayer


func _ready():
	wrathAnim.play("idleLeft")
