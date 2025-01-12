extends AbilityComponent
class_name AoEComponent

signal hit_object_created

@export var duration := 2.5

func spawn_ao_e_hit_object(packed_hit_object: PackedScene, spawn_position: Vector2, target_group: String):
	var hit_object = packed_hit_object.instantiate()
	var tile_map = get_node("/root/main/TileMap")
	tile_map.add_child(hit_object)
	tile_map.move_child(hit_object, 1)
	hit_object.global_position = spawn_position
	hit_object.life_time = duration
	hit_object.target_group = target_group
	hit_object_created.emit(hit_object)
