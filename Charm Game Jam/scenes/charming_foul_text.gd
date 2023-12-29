extends Node2D


var charming_tres:Resource = load("res://scenes/charming_text.tres")
var foul_tres:Resource = load("res://scenes/foul_text.tres")


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("float_away")


func set_type(string:String):
	if string.to_lower() == "foul":
		$RichTextLabel.text = 'Foul'
		$RichTextLabel.theme = foul_tres
	else:
		$RichTextLabel.text = 'Charming'
		$RichTextLabel.theme = charming_tres
