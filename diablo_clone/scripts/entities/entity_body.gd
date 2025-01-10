extends CharacterBody2D
class_name EntityBody

@export var max_health := 100.0
@onready var current_health: int = max_health
@export var speed := 40

var weapon: Node2D

func _ready() -> void:
	weapon = _get_weapon()
	
func _get_weapon():
	for child in get_children():
		if child is Weapon:
			return child
			
	print("Weapon missing on ", get_parent().name)
	
func try_reduce_current_health(amount: float):
	if (current_health - amount) > max_health:
		return
		
	current_health -= amount
	reduce_current_health(amount)

func reduce_current_health(amount: float):
	pass
	#push_error("abstract method")
