extends Node2D

var allowed_groups = [
	"ability_component"
]

var abilities: Array[Ability] = []

func _ready() -> void:
	var ability = preload("res://scenes/abilities/ability.tscn").instantiate()
	add_ability(ability)
		
func add_ability(ability: Ability):
	var allowed = false
	allowed = is_ability_in_allowed_group(ability)
	
	if not allowed:
		ability.queue_free()
		print("Ability '%s' is not in an allowed group!" % ability.name)
		return
		
	abilities.append(ability)
	add_child(ability)
	print("Ability '%s' succesfully added" % ability.name)

func is_ability_in_allowed_group(ability: Ability):
	var allowed = false
	for ability_component in ability.get_children():
		allowed = is_ability_component_in_allowed_group(ability_component)
	return allowed
			
func is_ability_component_in_allowed_group(ability_component: AbilityComponent):
	for group in allowed_groups:
		if ability_component.is_in_group(group):
			return true

#func _notification(what: int) -> void:
	#if what == NOTIFICATION_PARENTED:
		#for child in get_children():
			#var allowed = false
			#allowed = is_ability_in_allowed_group(child)
			#if not allowed:
				#child.quee_free()
				#print("Node '%s' is not in an allowed group!" % child.name)

#func _on_child_entered_tree(node: Node) -> void:
	#var node_class_name = node
	#print(node_class_name)
	#if node != Ability:
		#return
		#
	#var allowed = false
	#allowed = is_child_in_allowed_group(node)
	#
	#if not allowed:
		#node.quee_free()
		#print("Node '%s' is not in an allowed group!" % node.name)
		
#func add_child(node: Node, legible_unique_name := false, internal: InternalMode = 0):
	#var node_class_name = node
	#print(node_class_name)
	#if node != Ability:
		#return
		#
	#var allowed = false
	#allowed = is_child_in_allowed_group(node)
	#
	#if not allowed:
		#node.quee_free()
		#print("Node '%s' is not in an allowed group!" % node.name)
