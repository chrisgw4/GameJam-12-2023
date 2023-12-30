extends StaticBody2D


var end_game = preload("res://scenes/ending/end_game.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_end_game_body_entered(body):
	body.stop_everything = true
	body.sliding = false
	body.skidding = false
	body.velocity.x = 400
	body.velocity.y = 0
	


func _on_end_game_body_exited(body):
	if body.global_position.x > global_position.x:
		body.velocity.x = 0
		body._gray_out()
	
		var temp = end_game.instantiate()
		get_tree().current_scene.get_node("UI").add_child(temp)
		temp.total_charm = body.charm_progress
