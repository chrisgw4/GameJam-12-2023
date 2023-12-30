extends StaticBody2D


var wood_debris = [preload("res://scenes/debris/wood_1.tscn"),preload("res://scenes/debris/wood_2.tscn"), preload("res://scenes/debris/wood_3.tscn")]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_break_area_body_entered(body):
	body.charm_progress -= 10
	$BreakArea.queue_free()
	$AnimationPlayer.play("crash")
	$AudioStreamPlayer.play()
	
	for i in range(0, 7):
		var temp = wood_debris.pick_random().instantiate()
		get_tree().current_scene.call_deferred("add_child", temp)
		temp.global_position = global_position + Vector2(randi_range(-40, 40), randi_range(-20, 10))
	
