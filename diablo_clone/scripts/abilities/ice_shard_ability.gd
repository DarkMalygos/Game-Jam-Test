extends Ability
class_name IceShardAbility

var target_group: String

func activate(user: CharacterBody2D, target_group: String, target_position: Vector2):
	self.target_group = target_group
	var freezing_shard = $SingleTargetComponent.spawn_hit_object(preload("res://scenes/hit_objects/projectiles/ice_shard.tscn"), spawn_point.global_position, target_group)
	$RangedComponent.fly_projectile(target_position, freezing_shard)
	freezing_shard.target_group_collision.connect(_on_target_group_collision)
	freezing_shard.obstacle_collision.connect(_on_obstacle_collision)

func _on_target_group_collision(hit_object: HitObject, target: CharacterBody2D):
	if collision_count > 0:
		return
		
	$DamageComponent.deal_damage(target)
	$AfflictionComponent.try_create_affliction(preload("res://scripts/abilities/ice_affliction.tscn"), target)
	hit_object.queue_free()
	collision_count += 1
	
func _on_obstacle_collision(hit_object: HitObject):
	if collision_count > 0:
		return
		
	hit_object.queue_free()
	collision_count += 1
