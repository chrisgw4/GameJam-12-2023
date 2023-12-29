extends CanvasLayer


@onready var progress_bar:TextureProgressBar = $Control/TextureProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().current_scene.get_node("Player").connect("charm_changed", update_charm_bar)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func update_charm_bar(val):
	var tween = create_tween()
	tween.tween_property(progress_bar, "value", val, 0.2)
	tween.play()
	
