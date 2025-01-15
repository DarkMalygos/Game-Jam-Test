extends Affliction
class_name IceAffliction

func _ready() -> void:
	apply_time = life_time + 1
	_current_apply_time = apply_time

func apply():
	set_frozen(true)

func life_time_ended():
	set_frozen(false)

func set_frozen(is_frozen: bool):
	afflicted_target.is_moving = !is_frozen
	afflicted_target.can_use_ability = !is_frozen
	if is_frozen:
		afflicted_target.get_node("AnimatedSprite2D").stop()
		return
		
	afflicted_target.get_node("AnimatedSprite2D").play()
	
