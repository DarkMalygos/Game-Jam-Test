##When attaching a script with @tool in it reattach it
@tool
extends Node2D
class_name Weapon

#Don't change these:
@export_group("Ability count")
@export var minimum := 3
@export var maximum := 6
@export var current := 0:
	get:
		return _current_ability_count
		
@export var allowed_ability_components: Array[String] = []
		
var _current_ability_count:= 0
var _abilities: Array[Ability] = []
		
func _ready() -> void:	
	if !Engine.is_editor_hint():
		for child in get_children():
			if child is Ability:
				_abilities.append(child)
		
		if _abilities.size() < minimum:
			print("Missing abilities (minimum ability count: %d, current ability count: %d)" % [minimum, _abilities.size()])
		
func activate(index: int, user: CharacterBody2D):
	if !Engine.is_editor_hint():
		if _abilities.size() <= index:
			print("Ability not assigned to this input")
			return
		
		_abilities[index].try_activate(user)

func is_ability_in_allowed_group(ability: Ability):
	var allowed = false
	for child in ability.get_children():
		if child is AbilityComponent:
			allowed = is_ability_component_in_allowed_group(child)
	return allowed
			
func is_ability_component_in_allowed_group(ability_component: AbilityComponent):
	for allowed_ability_component in allowed_ability_components:
		if ability_component.name == allowed_ability_component:
			return true

func _notification(what: int) -> void:
	if what == NOTIFICATION_CHILD_ORDER_CHANGED:
		_current_ability_count = 0
		for child in get_children():
			if child is Ability:
				if !is_ability_in_allowed_group(child):
					child.queue_free()
					print("Node '%s' is not in an allowed ability components!" % child.name)
					return
					
				if _current_ability_count >= maximum:
					child.queue_free()
					return
					
				_current_ability_count+= 1
		
		
				
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

#func add_abilities():
	#for packed_ability in packed_abilities:
		#var ability = packed_ability.instantiate()
		#var allowed = false
		#allowed = is_ability_in_allowed_group(ability)
		#
		#if not allowed:
			#packed_abilities.erase(packed_ability)
			#ability.queue_free()
			#print("Ability '%s' is not in an allowed group!" % ability.name)
			#return
			#
		#add_child(ability)
		#_abilities.append(ability)
		#print("Ability '%s' succesfully added" % ability.name)
