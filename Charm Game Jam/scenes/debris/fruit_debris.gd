extends Debris


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.frame = randi_range(0,2)
	
	linear_velocity = Vector2(randf_range(-200,200), randf_range(-620,-500))
	angular_velocity = randf_range(-10, 10)


