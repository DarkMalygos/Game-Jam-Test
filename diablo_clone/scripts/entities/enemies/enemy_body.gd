extends EntityBody
class_name EnemyBody

@onready var main_character := get_node("../../MainCharacter/CharacterBody2D")

var direction: Vector2
var colliding_enemy_area: Area2D

func _physics_process(delta: float) -> void:
	if colliding_enemy_area:
		if colliding_enemy_area.global_position.distance_to(global_position) >= 20:
			colliding_enemy_area = null
			return
		
		direction = -(colliding_enemy_area.get_parent().global_position - global_position).normalized()
		velocity = direction * speed
		
	else:
		direction = Vector2(main_character.global_position - global_position).normalized()
		velocity = direction * speed
	move_and_slide()

func _reduce_current_health():
	$HealthBar.value = current_health * 100 / max_health

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().is_in_group("enemy"):
		colliding_enemy_area = area
