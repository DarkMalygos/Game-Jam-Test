extends Node2D
class_name HitObject

signal hit_object_collision

var group: String

func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	var target = area.get_parent()
	if !target.is_in_group(group):
		return
		
	hit_object_collision.emit(self, target)
