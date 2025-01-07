##Every scene that can move

extends CharacterBody2D
class_name EntityBody

@export var speed := 70

@onready var weapon = get_node("Weapon")
