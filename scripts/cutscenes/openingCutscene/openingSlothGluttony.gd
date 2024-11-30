extends DialogicBackground

@onready var slothAnim = $Sloth/AnimationPlayer
@onready var gluttonyAnim = $Gluttony/AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	slothAnim.play("idleRight")
	gluttonyAnim.play("idleLeft")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
