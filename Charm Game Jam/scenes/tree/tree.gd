extends StaticBody2D


var player:CharacterBody2D = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$TextureProgressBar.value = 6 - $Timer.time_left


func _on_area_2d_body_entered(body):
	#print("Entered")
	player = body
	$Timer.start(6)
	$Area2D.queue_free()


func _on_timer_timeout():
	$Cat/AnimationPlayer.play("Fall")
	$Cat.gravity_scale = 1
	$Cat.get_node("CollisionShape2D").disabled = false
	$TextureProgressBar.visible = false


func _on_cat_death_plane_body_entered(body):
	$Cat/AnimationPlayer.play("Die")
	if player and not body.already_charmed:
		$Cat_Died.play()
		player.charm_progress -= 10
		body.already_charmed = true
