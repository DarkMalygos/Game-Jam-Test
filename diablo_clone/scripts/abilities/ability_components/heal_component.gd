extends AbilityComponent
class_name HealComponent

@export var heal := 15

func single_target_heal(user: CharacterBody2D):
	user.try_reduce_current_health(-heal)
