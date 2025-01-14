extends Affliction
class_name FireAffliction

var damage := 5

func apply():
	afflicted_target.try_reduce_current_health(damage)
