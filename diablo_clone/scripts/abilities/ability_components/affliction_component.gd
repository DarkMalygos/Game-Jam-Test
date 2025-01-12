extends AbilityComponent
class_name AfflictionComponent

func try_create_affliction(packed_affliction: PackedScene, target: CharacterBody2D, stacking = false):
	var affliction = packed_affliction.instantiate()
	
	if target.has_node(str(affliction.name)) && !stacking:
		return
		
	affliction.afflicted_target = target
	target.add_child(affliction)
