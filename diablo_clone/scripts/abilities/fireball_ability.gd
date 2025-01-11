extends Ability

func activate(user: CharacterBody2D, target_group: String, target_position: Vector2):
	var projectile = $SingleTargetComponent.spawn_hit_object(preload("res://scenes/hit_objects/projectiles/projectile.tscn"), spawn_point.global_position)
	$RangedComponent.fly_projectile(target_group, target_position, projectile)
	projectile.target_group_collision.connect(_on_target_group_collision)
	projectile.obstacle_collision.connect(_on_obstacle_collision)

func _on_target_group_collision(hit_object: HitObject, target: CharacterBody2D):
	$DamageComponent.deal_damage(target)
	hit_object.queue_free()

func _on_obstacle_collision(hit_object: HitObject):
	hit_object.queue_free()
