extends EntityBody
class_name EnemyBody

@onready var main_character := get_node("../../MainCharacter/CharacterBody2D")

func _physics_process(delta: float) -> void:
	var direction = Vector2(main_character.global_position - global_position).normalized()
	velocity = direction * speed
	move_and_slide()
