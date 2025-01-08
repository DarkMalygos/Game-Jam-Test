extends Node2D
class_name Ability

@export var ability_name := "Ability base class"
@export var cooldown := 2.0
@export var self_damage = 10

var ability_components: Array[AbilityComponent] = []
var cooldown_timer := 0.0
var active := true

func _ready() -> void:
	for node in get_children():
		if node is AbilityComponent:
			ability_components.append(node)

func activate(user: CharacterBody2D):
	if !active:
		return
	user.change_current_health(self_damage)
		
	print(name)
	active = false
	print(name)

func _process(delta: float) -> void:
	if active:
		return
	
	cooldown_timer += delta
	
	if cooldown_timer >= cooldown:
		active = true
		cooldown_timer = 0
