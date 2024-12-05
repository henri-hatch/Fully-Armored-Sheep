extends DialogicBackground

@onready var deceitAnim = $Deceit/AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	deceitAnim.play("idleLeft")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
