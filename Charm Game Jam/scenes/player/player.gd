extends CharacterBody2D



@onready var animated_sprite = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer
@onready var pickup_slot:Node2D = $"PickUp Slot"
@onready var pick_up_cooldown:Timer = $Pickup_CoolDown


@onready var charming_foul_text = preload("res://scenes/charming_foul_text.tscn")


const SPEED = 400.0
const JUMP_VELOCITY = -650.0

const FRICTION = 0.04
var skidding = false


signal charm_changed(new_charm)
var charm_progress = 50:
	set(new_val):
		if new_val < charm_progress: # lost charm
			var temp = charming_foul_text.instantiate()
			temp.set_type("foul")
			get_tree().current_scene.add_child(temp)
			temp.global_position = global_position + Vector2(20,0)
		else:
			var temp = charming_foul_text.instantiate()
			temp.set_type("charming")
			get_tree().current_scene.add_child(temp)
			temp.global_position = global_position+ Vector2(20,0)
			
		charm_progress = new_val
		if charm_progress < 0:
			charm_progress = 0
		emit_signal("charm_changed", charm_progress)
		
		

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

signal pick_up_pressed
signal drop_pressed
var holding_object:bool = false
var stop_pickup:bool = false


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		skidding = false
		velocity.x = direction * SPEED
	else:
		skidding = true
		velocity.x = lerpf(velocity.x, 0, FRICTION)#move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _input(_event):
	if Input.is_action_just_pressed("pick_up") and not stop_pickup:
		if not holding_object and is_on_floor() and not velocity.y < 0:
			emit_signal("pick_up_pressed")
		else:
			emit_signal("drop_pressed")
		pick_up_cooldown.start(0.25)
		stop_pickup = true


func _on_pickup_cool_down_timeout():
	stop_pickup = false
