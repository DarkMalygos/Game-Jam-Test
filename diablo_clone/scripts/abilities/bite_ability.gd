extends Ability
class_name BiteAbility

@onready var main_character: MainCharacterBody = get_node("../../../../MainCharacter/CharacterBody2D")
@onready var animated_sprite: AnimatedSprite2D = get_node("../../AnimatedSprite2D")

func activate(user: CharacterBody2D, target_group: String, target_position: Vector2):
	$DamageComponent.deal_damage(main_character)
	animated_sprite.play("attack")
