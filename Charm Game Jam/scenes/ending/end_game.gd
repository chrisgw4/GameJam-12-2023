extends Control


var total_charm:int

# Called when the node enters the scene tree for the first time.
func _ready():
	# play drumroll here
	await get_tree().create_timer(0.5).timeout
	var tween = create_tween()
	
	tween.tween_property($TextureProgressBar, "value", total_charm, 3)
	tween.play()
	
	await tween.finished
	# play happy/sad music here
	if $TextureProgressBar.value >= 80:
		pass # happy music
	else:
		pass # sad music
	
	await get_tree().create_timer(4).timeout
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")
	


func _on_area_2d_body_entered(body:RigidBody2D):
	body.linear_velocity.x = 400


func _on_area_2d_body_exited(body):
	body.linear_velocity.x = 0
