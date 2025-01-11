extends HitObject
class_name Projectile

signal obstacle_collision

var direction: Vector2
var speed: float
var max_travel_distance: float
var travel_distance := 0.0

func set_fly_parameters(target_position: Vector2, speed: float, max_travel_distance: float, target_group: String):
	direction = Vector2(target_position - global_position).normalized()
	self.speed = speed
	self.max_travel_distance = max_travel_distance
	self.target_group = target_group

func _physics_process(delta: float) -> void:
	global_position += direction * speed
	travel_distance += speed
	
	if travel_distance >= max_travel_distance:
		queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("obstacle"):
		obstacle_collision.emit(self)
