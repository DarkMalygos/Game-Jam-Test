extends EnemyBody

func _ready() -> void:
	super._ready()
	$AnimatedSprite2D.play("move")

func _process(delta: float) -> void:
	if can_use_ability:
		_activate_ability()

func _activate_ability():
	if !main_character:
		return
	
	if global_position.distance_squared_to(main_character.global_position) > 50:
		if $AnimatedSprite2D.animation != "move":
			$AnimatedSprite2D.play("move")
		return
	
	weapon.activate(0, self, "main_character", main_character.global_position)
