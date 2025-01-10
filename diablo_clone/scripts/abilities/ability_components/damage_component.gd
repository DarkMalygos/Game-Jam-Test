extends AbilityComponent
class_name DamageComponent

@export var damage := 10

func deal_damage(target: CharacterBody2D):
	target.reduce_current_health(damage)
