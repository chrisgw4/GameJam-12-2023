extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var temp = get_node_or_null("Level/Tutorial")
	
	if temp:
		temp.connect("end_tutorial", _start_timer)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_timer_timeout():
	pass # GAME OVER

func _start_timer():
	$UI/Control/TimeLabel/Timer.start()
	$UI/Control/TimeLabel.set_process(true)
