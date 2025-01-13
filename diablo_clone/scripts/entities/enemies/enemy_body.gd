extends EntityBody
class_name EnemyBody

@export var seperation_distance := 7.5

@onready var main_character := get_node("../../MainCharacter/CharacterBody2D")

var colliding_enemy_area: Area2D

#func _ready() -> void:
	#$Area2D.area_entered.connect(_on_area_2d_area_entered)

func _physics_process(delta: float) -> void:
	var main_character_direction = (main_character.global_position - global_position).normalized()
	
	#if colliding_enemy_area:
		#if colliding_enemy_area.global_position.distance_to(global_position) >= seperation_distance:
			#colliding_enemy_area = null
			#return
		#
		#var enemy_direction = -(colliding_enemy_area.get_parent().global_position - global_position).normalized()
		#var direction = main_character_direction + enemy_direction
		#velocity = direction * speed * colliding_enemy_area.global_position.distance_to(global_position) / seperation_distance
	#else:
	velocity = main_character_direction * speed
	move_and_slide()

func _reduce_current_health():
	$HealthBar.value = current_health * 100 / max_health

#func _on_area_2d_area_entered(area: Area2D) -> void:
	#_on_enemy_collision(area)
	#if area.get_parent().is_in_group("enemy"):
		#colliding_enemy_area = area
		
#func _on_enemy_collision(area: Area2D):
	#pass
