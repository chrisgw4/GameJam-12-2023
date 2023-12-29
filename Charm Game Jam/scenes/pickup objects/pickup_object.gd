extends RigidBody2D



@onready var area_2d = $PickupRange

var pickupable = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print("SKHDougsadfioudsgfsodiugfdsouifgousdfgousdgfsoui")


func set_pickupable(val:bool):
	pickupable = val
	print(pickupable)




