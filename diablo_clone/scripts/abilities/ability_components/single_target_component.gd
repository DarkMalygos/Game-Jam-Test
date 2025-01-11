extends AbilityComponent
class_name SingleTargetComponent

func spawn_hit_object(packed_hit_object: PackedScene, spawn_position: Vector2):
	var hit_object = packed_hit_object.instantiate()
	get_node("/root/main/TileMap").add_child(hit_object)
	hit_object.global_position = spawn_position
	return hit_object
