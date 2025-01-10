extends Ability

func activate(user: CharacterBody2D, group: String, target_position: Vector2):
	var projectile = $SingleTargetComponent.spawn_hit_object(preload("res://scenes/hit_objects/projectiles/projectile.tscn"), spawn_point.global_position)
	$RangedComponent.fly_projectile(group, target_position, projectile)
