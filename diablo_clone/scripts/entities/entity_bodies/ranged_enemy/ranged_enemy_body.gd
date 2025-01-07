extends EntityBody

#const JUMP_VELOCITY = -400.0
@export var stop_distance := 80.0
@export var move_away_distance := 50.0

@onready var main_character_body := get_node("/root/Main/TileMap/MainCharacter").get_child(0)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var main_character_position = main_character_body.global_position
	var main_character_distance = main_character_position.distance_to(global_position)
	
	var direction = (main_character_position - global_position).normalized()
	
	
	if main_character_distance < move_away_distance:
		velocity = -direction * speed
	elif main_character_distance < stop_distance:
		velocity = Vector2.ZERO
	else:
		velocity = direction * speed
	
	move_and_slide()
