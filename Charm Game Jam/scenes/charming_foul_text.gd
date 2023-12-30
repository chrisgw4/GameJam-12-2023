extends Node2D


var charming_tres:Resource = load("res://scenes/charming_text.tres")
var foul_tres:Resource = load("res://scenes/foul_text.tres")

var charm_array = ["Charming", "Dashing", "Endearing", "Smashing"]
var foul_array = ["Foul", "Repulsive", ]


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("float_away")


func set_type(string:String):
	if string.to_lower() == "foul":
		$RichTextLabel.text = 'Foul'
		$RichTextLabel.theme = foul_tres
	elif string.to_lower() == "charming":
		$RichTextLabel.text = charm_array.pick_random()
		$RichTextLabel.theme = charming_tres
	elif string.to_lower() == "irresistable":
		$RichTextLabel.text = "Irresistable"
		$RichTextLabel.theme = charming_tres
	else:
		$RichTextLabel.text = '1'
		$RichTextLabel.theme = charming_tres
