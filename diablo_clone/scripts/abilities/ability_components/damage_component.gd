extends AbilityComponent
class_name DamageComponent

@export var damage := 10

func deal_damage(user: CharacterBody2D, target: Vector2):
	print(damage)
