extends Area2D


var player:CharacterBody2D = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

var fruit_debris = [preload("res://scenes/debris/apple.tscn"), preload("res://scenes/debris/banana.tscn"), preload("res://scenes/debris/pear.tscn")]

func _on_body_entered(body):
	if player and not body.already_charmed:
		player.charm_progress += 5
		body.get_node("AnimationPlayer").play("survived")
		$Cat_Saved.play()
		body.already_charmed = true
		body.global_position.x = get_parent().global_position.x
		
		$CollisionShape2D.set_deferred("disabled", true)
		set_deferred("monitorable", false)
		set_deferred("monitoring", false)
		get_parent().pickupable = false # make it so box cannot be used again
		get_parent().pick_up_range_collision.set_deferred("disabled", true)
		
		for i in range(0, 5):
			var temp = fruit_debris.pick_random().instantiate()
			get_tree().current_scene.call_deferred("add_child", temp)
			temp.global_position = global_position + Vector2(randi_range(-40, 40), randi_range(-20, 10))
