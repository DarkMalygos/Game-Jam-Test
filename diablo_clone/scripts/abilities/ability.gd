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

func try_activate(user: CharacterBody2D, group: String, target_position: Vector2):
	if !active:
		return
		
	user.change_current_health(self_damage)
	active = false
	activate(user, group, target_position)

##Override this in child
func activate(user: CharacterBody2D, group: String, target_position: Vector2):
	pass
