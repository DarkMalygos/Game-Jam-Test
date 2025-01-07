extends Node2D
class_name Weapon

@export var abilities: Array[Ability]

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	for ability in abilities:
		ability.update_cooldown_timer(delta)
