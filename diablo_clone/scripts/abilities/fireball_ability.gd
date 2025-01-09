extends Ability

func activate(user: CharacterBody2D):
	ability_components[0].deal_damage(user, Vector2.ZERO)
