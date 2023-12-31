extends FiniteStateMachine


# Called when the node enters the scene tree for the first time.
func _ready():
	_add_state("idle")
	_add_state("move")
	_add_state("jump")
	_add_state("fall")
	_add_state("slide")
	_add_state("slide_start")
	_add_state("skid")
	
	set_state(states['idle'])


func _state_logic(_delta: float) -> void:
	pass


func _get_transition() -> int:
	
	if parent.velocity.x > 10:
		parent.animated_sprite.flip_h = false
	if parent.velocity.x < -10:
		parent.animated_sprite.flip_h = true
	
	if parent.velocity.y > 10 and not parent.sliding:
		return states["jump"]
	
	if not parent.is_on_floor() and not parent.sliding:
		
		return states["fall"]
	
	if parent.sliding and abs(parent.velocity.x) > 6:
		if parent.start_sliding:
			return states["slide_start"]
		else:
			return states["slide"]
	
	if parent.skidding and abs(parent.velocity.x) > 7:
		return states['skid']
	
	if parent.velocity.x > 10:
		return states["move"]
	
	if parent.velocity.x < -10:
		return states["move"]
	
	return states["idle"]



func _enter_state(_previous_state: int, _new_state: int) -> void:
	#print(states_names[state])
	animation_player.play(states_names[state])
