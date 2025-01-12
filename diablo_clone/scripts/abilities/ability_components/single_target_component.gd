extends AbilityComponent
class_name SingleTargetComponent

func spawn_hit_object(packed_hit_object: PackedScene, spawn_position: Vector2, target_group: String):
	var hit_object = packed_hit_object.instantiate()
	get_node("/root/main/TileMap").add_child(hit_object)
	hit_object.global_position = spawn_position
	hit_object.target_group = target_group
	return hit_object
