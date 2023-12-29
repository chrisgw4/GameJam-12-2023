extends RigidBody2D


var pickupable = false
var player = null
var picked_up:bool = false
var move_to_pickup_slot = false

@onready var pick_up_range = $PickUpRange
@onready var pick_up_range_collision = $PickUpRange/CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _physics_process(_delta):
	rotation = 0
	
	if move_to_pickup_slot:
		global_position = global_position.lerp(player.pickup_slot.global_position, 0.15)
		if global_position.distance_to(player.pickup_slot.global_position) < 0.25:
			global_position = player.pickup_slot.global_position

func _on_pick_up_range_body_entered(body):
	
	if player == null:
		pickupable = true
		player = body
		player.connect("pick_up_pressed", _pick_me_up)
		player.connect("drop_pressed", _drop_me_down)


func _on_pick_up_range_body_exited(_body):
	#print("out of range")
	if not picked_up:
		pickupable = false
		player.holding_object = false
		player.disconnect("pick_up_pressed", _pick_me_up)
		player.disconnect("drop_pressed", _drop_me_down)
		player = null
	


func _pick_me_up():
	if not player.holding_object:
		$CollisionShape2D.disabled = true
		$CollisionShape2D2.disabled = true
		player.holding_object = true
		#print("Picking me up")
		picked_up = true
		pick_up_range.monitorable = false
		reparent(player.pickup_slot)
		#global_position = player.pickup_slot.global_position
		gravity_scale = 0
		linear_velocity = Vector2.ZERO
		move_to_pickup_slot = true


func _drop_me_down():
	$CollisionShape2D.disabled = false
	$CollisionShape2D2.disabled = false
	picked_up = false
	pick_up_range.monitorable = true
	reparent(get_tree().current_scene)
	gravity_scale = 1
	move_to_pickup_slot = false
	

