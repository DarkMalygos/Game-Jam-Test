extends Node2D
class_name Ability

@export var cooldown := 2.0
@export var self_damage := 10

@onready var spawn_point := get_node("../SpawnPoint")

var cooldown_timer := 0.0
var active := true

func _process(delta: float) -> void:
	if active:
		return
	
	cooldown_timer += delta
	
	if cooldown_timer >= cooldown:
		active = true
		cooldown_timer = 0
		print(name, " is active")

func try_activate(user: CharacterBody2D, target_group: String, target_position: Vector2):
	if !active:
		return
		
	user.try_reduce_current_health(self_damage)
	active = false
	activate(user, target_group, target_position)

func activate(user: CharacterBody2D, target_group: String, target_position: Vector2):
	push_error("abstract method")
