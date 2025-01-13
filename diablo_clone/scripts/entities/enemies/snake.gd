extends EnemyBody

func _on_enemy_collision(area: Area2D):
	if(area.get_parent().is_in_group("main_character")):
		#print(area.get_parent())
		pass
