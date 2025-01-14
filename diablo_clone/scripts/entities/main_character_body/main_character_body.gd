extends EntityBody
class_name MainCharacterBody

signal health_changed()

var z_velocity = 0.0
var z_position = 0.0
var gravity = -100
var jump_strength = 80.0

func _physics_process(delta: float) -> void:
	var direction: Vector2
	
	if Input.is_action_just_pressed("jump") and z_position == 0:
		z_velocity = jump_strength
		print(velocity)
	
	z_velocity += gravity * delta
	z_position += z_velocity * delta
	
	if z_position <= 0:
		z_position = 0
		z_velocity = 0
		
		direction = Input.get_vector("movement_left", "movement_right", "movement_up", "movement_down")
		
	else:
		if Input.is_action_pressed("movement_left"):
			print(velocity)
			direction = Vector2(-1, 0)
		if Input.is_action_pressed("movement_right"):
			print(velocity)
			direction = Vector2(1, 0)
			
	set_main_character_velocitiy(direction)
			
	update_character_position()
	
	if Input.is_action_pressed("ability_one"):
		weapon.activate(0, self, "enemy", get_global_mouse_position())
	if Input.is_action_pressed("ability_two"):
		weapon.activate(1, self, "enemy", get_global_mouse_position())

	move_and_slide()

func set_main_character_velocitiy(direction: Vector2):
		if direction:
			velocity = direction * speed
		else:
			velocity = Vector2.ZERO

func update_character_position():
	var screen_position = Vector2(global_position.x, global_position.y - z_position)
	$AnimatedSprite2D.global_position = screen_position
	$Camera2D.global_position = screen_position
	weapon.global_position = screen_position

func _reduce_current_health():
	health_changed.emit()
