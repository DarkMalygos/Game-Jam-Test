extends EntityBody
class_name EnemyBody

@onready var main_character := get_node("../../MainCharacter/CharacterBody2D")

var colliding_enemy_area: Area2D

func _physics_process(delta: float) -> void:
	if is_moving:
		_move(delta)
	
func _move(delta: float):
	if !main_character:
		return
	
	if global_position.distance_squared_to(main_character.global_position) <= 50:
		return
	
	var main_character_direction = (main_character.global_position - global_position).normalized()
	velocity = main_character_direction * speed
	move_and_slide()

func _reduce_current_health():
	$HealthBar.value = current_health * 100 / max_health
