extends Ability

var target_group: String

func _ready() -> void:
	$AoEComponent.hit_object_created.connect(_on_ao_e_hit_object_created)

func activate(user: CharacterBody2D, target_group: String, target_position: Vector2):
	self.target_group = target_group
	var projectile = $SingleTargetComponent.spawn_hit_object(preload("res://scenes/hit_objects/projectiles/fireball.tscn"), spawn_point.global_position, target_group)
	$RangedComponent.fly_projectile(target_position, projectile)
	projectile.target_group_collision.connect(_on_target_group_collision)
	projectile.obstacle_collision.connect(_on_obstacle_collision)

func _on_ao_e_hit_object_created(hit_object: HitObject):
	hit_object.target_group_collision.connect(_on_ao_e_target_group_collision)
	pass

func _on_target_group_collision(hit_object: HitObject, target: CharacterBody2D):
	if collision_count > 0:
		return
		
	$DamageComponent.deal_damage(target)
	var ao_e_hit_object = $AoEComponent.call_deferred("spawn_ao_e_hit_object", preload("res://scenes/hit_objects/ao_e_hit_objects/fireball_explosion.tscn"), target.global_position, target_group)
	hit_object.queue_free()
	collision_count += 1

func _on_obstacle_collision(hit_object: HitObject):
	if collision_count > 0:
		return
		
	$AoEComponent.call_deferred("spawn_ao_e_hit_object", preload("res://scenes/hit_objects/ao_e_hit_objects/fireball_explosion.tscn"), hit_object.global_position, target_group)
	hit_object.queue_free()
	collision_count += 1

func _on_ao_e_target_group_collision(hit_object: HitObject, target: CharacterBody2D):
	$AfflictionComponent.try_create_affliction(preload("res://scenes/afflictions/fire_affliction.tscn"), target)
