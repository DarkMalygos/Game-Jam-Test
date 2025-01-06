extends Resource
class_name Ability

@export var name: String
@export var cooldown := 2.0
var cooldown_timer := 0.0
var active := true

##Override this method in child classes
func activate(user: Node2D, target_position: Vector2):
	if active:
		print(name)
		active = false

func update_cooldown_timer(delta):
	if active:
		return
		
	cooldown_timer += delta
	if cooldown <= cooldown_timer:
		active = true
		cooldown_timer = 0
