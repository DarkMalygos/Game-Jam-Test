extends EntityBody
class_name MainCharacterBody

#@export var jump_velocity = -40.0

func _physics_process(delta: float) -> void:
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#velocity.y = jump_velocity
	
	if Input.is_action_just_pressed("ability_one"):
		weapon.abilities[0].activate(self, Vector2.ZERO)
	
	var direction := Input.get_vector("movement_left", "movement_right", "movement_up", "movement_down")
	if direction:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO

	move_and_slide()
