extends AbilityComponent
class_name DamageComponent

@export var damage := 10.0

func deal_damage(target: CharacterBody2D):
	target.try_reduce_current_health(damage)
