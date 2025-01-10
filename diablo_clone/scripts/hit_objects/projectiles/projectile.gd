extends HitObject
class_name Projectile

var direction: Vector2
var speed: float
var max_travel_distance: float
var travel_distance := 0.0

func set_fly_parameters(target_position: Vector2, speed: float, max_travel_distance: float, group: String):
	direction = Vector2(target_position - global_position).normalized()
	self.speed = speed
	self.max_travel_distance = max_travel_distance
	self.group = group

func _physics_process(delta: float) -> void:
	global_position += direction * speed
	travel_distance += speed
	
	if travel_distance >= max_travel_distance:
		queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("wall"):
		queue_free()
