extends Debris


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.frame = randi_range(0,2)
	
	linear_velocity = Vector2(randf_range(-260,260), randf_range(-420,-300))
	angular_velocity = randf_range(-10, 10)



