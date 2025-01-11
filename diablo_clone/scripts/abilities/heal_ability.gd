extends Ability

func activate(user: CharacterBody2D, target_group: String, target_position: Vector2):
	$HealComponent.single_target_heal(user)
