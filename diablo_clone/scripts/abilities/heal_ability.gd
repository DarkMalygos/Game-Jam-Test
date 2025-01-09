extends Ability

func activate(user: CharacterBody2D):
	ability_components[0].single_target_heal(user)
