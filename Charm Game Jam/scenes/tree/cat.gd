extends RigidBody2D


var already_charmed:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Hang")


