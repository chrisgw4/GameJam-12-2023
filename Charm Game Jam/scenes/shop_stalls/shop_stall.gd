extends StaticBody2D


var wood_debris = preload("res://scenes/debris/wood_debris.tscn")
var fruit_debris = [preload("res://scenes/debris/apple.tscn"), preload("res://scenes/debris/banana.tscn"), preload("res://scenes/debris/pear.tscn")]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_break_area_body_entered(body):
	body.charm_progress -= 10
	$BreakArea.queue_free()
	#set_collision_layer_value(1, false)
	call_deferred("set_collision_layer_value", 1, false)
	$AnimationPlayer.play("crash")
	
	for i in range(0, 5):
		var temp = wood_debris.instantiate()
		get_tree().current_scene.add_child(temp)
		temp.global_position = global_position + Vector2(randi_range(-40, 40), randi_range(-20, 10))
	
	for i in range(0, 5):
		var temp = fruit_debris.pick_random().instantiate()
		get_tree().current_scene.add_child(temp)
		temp.global_position = global_position + Vector2(randi_range(-40, 40), randi_range(-20, 10))
