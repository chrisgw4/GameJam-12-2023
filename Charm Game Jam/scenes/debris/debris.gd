extends RigidBody2D
class_name Debris


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.frame = randi_range(0,2)
	
	linear_velocity = Vector2(randf_range(-160,160), randf_range(-520,-400))
	angular_velocity = randf_range(-10, 10)
	
