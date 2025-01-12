extends Node2D
class_name Affliction

@export var life_time := 3.0
@export var apply_time := .5

var _current_life_time := 0.0
@onready var _current_apply_time := apply_time
var afflicted_target: CharacterBody2D

func _process(delta: float) -> void:
	if _current_life_time >= life_time:
		queue_free()
		return
		
	_current_life_time += delta
		
	if _current_apply_time <= apply_time:
		_current_apply_time += delta
		return
	
	_current_apply_time = 0
	apply()

func apply():
	push_error("abstract method")
