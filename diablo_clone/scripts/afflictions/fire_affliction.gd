extends Affliction
class_name FireAffliction

var damage := 5

func apply():
	get_parent().try_reduce_current_health(damage)
