extends Ability

func activate(user: CharacterBody2D, group: String, target_position: Vector2):
	$HealComponent.single_target_heal(user)
