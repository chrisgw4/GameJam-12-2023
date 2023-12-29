extends StaticBody2D


var player:CharacterBody2D = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$TextureProgressBar.value = 10 - $Timer.time_left


func _on_area_2d_body_entered(body):
	print("Entered")
	player = body
	$Timer.start(10)
	$Area2D.queue_free()


func _on_timer_timeout():
	if player:
		player.charm_progress -= 10
	$TextureProgressBar.visible = false
