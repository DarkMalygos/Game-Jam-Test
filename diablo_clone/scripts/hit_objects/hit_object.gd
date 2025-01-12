extends Node2D
class_name HitObject

signal target_group_collision
signal obstacle_collision

var target_group: String

func _on_area_2d_area_entered(area: Area2D) -> void:
	var target = area.get_parent()
	if !target.is_in_group(target_group):
		return
		
	target_group_collision.emit(self, target)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("obstacle"):
		obstacle_collision.emit(self)
