extends HitObject
class_name AoEHitObject

signal target_exited

var life_time: float
var current_life_time := 0.0

func _process(delta: float) -> void:
	if current_life_time >= life_time:
		queue_free()
		return

	current_life_time += delta

func _on_area_2d_area_exited(area: Area2D) -> void:
	var target = area.get_parent()
	if !target.is_in_group(target_group):
		return
		
	target_exited.emit(target)
