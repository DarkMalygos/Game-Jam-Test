extends AoEHitObject
class_name BlackHole

func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation != "closing":
		return
		
	queue_free()
