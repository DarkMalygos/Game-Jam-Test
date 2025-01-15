extends Ability
class_name BlackHoleAbility

var target_group: String

func _ready() -> void:
	$AoEComponent.hit_object_created.connect(_on_ao_e_hit_object_created)

func activate(user: CharacterBody2D, target_group: String, target_position: Vector2):
	self.target_group = target_group
	var fireball = $SingleTargetComponent.spawn_hit_object(preload("res://scenes/hit_objects/projectiles/black_hole_projectile.tscn"), spawn_point.global_position, target_group)
	$RangedComponent.fly_projectile(target_position, fireball)
	fireball.target_group_collision.connect(_on_target_group_collision)
	fireball.obstacle_collision.connect(_on_obstacle_collision)

func _on_target_group_collision(hit_object: HitObject, target: CharacterBody2D):
	if collision_count > 0:
		return
		
	$DamageComponent.deal_damage(target)
	var ao_e_hit_object = $AoEComponent.call_deferred("spawn_ao_e_hit_object", preload("res://scenes/hit_objects/ao_e_hit_objects/black_hole.tscn"), target.global_position, target_group)
	hit_object.queue_free()
	collision_count += 1

func _on_obstacle_collision(hit_object: HitObject):
	if collision_count > 0:
		return
		
	$AoEComponent.call_deferred("spawn_ao_e_hit_object", preload("res://scenes/hit_objects/ao_e_hit_objects/black_hole.tscn"), hit_object.global_position, target_group)
	hit_object.queue_free()
	collision_count += 1
	
func _on_ao_e_hit_object_created(hit_object: HitObject):
	collision_count = 0
	hit_object.target_group_collision.connect(_on_ao_e_target_group_collision)

func _on_ao_e_target_group_collision(hit_object: HitObject, target: CharacterBody2D):		
	if target.current_health > 20:
		hit_object.queue_free()
		return
		
	if collision_count > 0:
		return
		
	hit_object.get_node("AnimatedSprite2D").play("closing")
	target.try_reduce_current_health(target.max_health)
	collision_count += 1
