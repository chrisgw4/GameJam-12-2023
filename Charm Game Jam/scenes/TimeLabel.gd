extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	#$Timer.start()
	set_process(false)
	text = ""
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	text = str(int($Timer.time_left))
