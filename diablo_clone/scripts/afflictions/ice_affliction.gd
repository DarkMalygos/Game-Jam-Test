extends Affliction
class_name IceAffliction

func _ready() -> void:
	apply_time = life_time + 1
	_current_apply_time = apply_time

func apply():
	afflicted_target.is_moving = false

func life_time_ended():
	afflicted_target.is_moving = true
