extends Node2D

@export var weapon := Node2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ability_one"):
		weapon.abilities[0].activate(self, Vector2.ZERO)
