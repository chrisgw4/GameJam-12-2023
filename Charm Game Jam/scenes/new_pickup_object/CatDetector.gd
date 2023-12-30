extends Area2D


var player:CharacterBody2D = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(body):
	if player and not body.already_charmed:
		player.charm_progress += 5
		$Cat_Saved.play()
		body.already_charmed = true
	body.global_position.x = get_parent().global_position.x
	
	$CollisionShape2D.set_deferred("disabled", true)
	set_deferred("monitorable", false)
	set_deferred("monitoring", false)
	get_parent().pickupable = false # make it so box cannot be used again
	get_parent().pick_up_range_collision.set_deferred("disabled", true)
