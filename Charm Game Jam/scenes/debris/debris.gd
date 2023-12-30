extends RigidBody2D
class_name Debris


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.frame = randi_range(0,2)
	print($AnimatedSprite2D.frame)
	
	linear_velocity = Vector2(randf_range(-160,160), randf_range(-420,-300))
	angular_velocity = randf_range(-10, 10)
	
