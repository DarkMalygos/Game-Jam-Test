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
	var test_amount := current_health - amount
		
	current_health = max(0, min(max_health, test_amount))
	
	if current_health == 0:
		get_parent().queue_free()
		#print("dead")
		return
		
	_reduce_current_health()

func _reduce_current_health():
	print(get_parent().name, ": ", current_health)
	push_error("abstract method")
