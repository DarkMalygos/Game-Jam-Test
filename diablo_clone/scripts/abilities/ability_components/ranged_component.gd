extends AbilityComponent

@export var speed := 5
@export var ability_range := 100
	
func fly_projectile(target_position: Vector2, projectile: HitObject):
	projectile.set_fly_parameters(target_position, speed, ability_range)
