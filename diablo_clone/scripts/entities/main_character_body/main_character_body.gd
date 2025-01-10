extends EntityBody
class_name MainCharacterBody

signal health_changed()

#@export var jump_velocity = -40.0

func _physics_process(delta: float) -> void:
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = jump_velocity
	
	if Input.is_action_pressed("ability_one"):
		weapon.activate(0, self, "enemy", get_global_mouse_position())
	if Input.is_action_pressed("ability_two"):
		weapon.activate(1, self, "enemy", get_global_mouse_position())

	var direction := Input.get_vector("movement_left", "movement_right", "movement_up", "movement_down")
	if direction:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO

	move_and_slide()

func reduce_current_health(amount: float):
	health_changed.emit()
