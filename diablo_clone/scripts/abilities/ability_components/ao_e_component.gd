extends AbilityComponent
class_name AoEComponent

@export var life_time := 5.0

###change this:
#var current_life_time := 0.0
#var hit_object: HitObject

func spawn_hit_object(packed_hit_object: PackedScene, spawn_position: Vector2):
	var hit_object = packed_hit_object.instantiate()
	var tile_map = get_node("/root/main/TileMap")
	tile_map.add_child(hit_object)
	tile_map.move_child(hit_object, 1)
	hit_object.global_position = spawn_position
	return hit_object

##and this:
#func _process(delta: float) -> void:
	#if current_life_time >= life_time:
		#hit_object.queue_free()
		#return
#
	#current_life_time += delta
