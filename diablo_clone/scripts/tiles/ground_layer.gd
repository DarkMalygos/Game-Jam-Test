extends TileMapLayer

func _ready() -> void:
	create_cell_boundaries(10)
	
func create_cell_boundaries(radius: int):
	var used_cells = get_used_cells()
	
	for used_cell in used_cells:
		for x in range(-radius, radius + 1):  # Vízszintesen a sugár mentén
			for y in range(-radius, radius + 1):  # Függőlegesen a sugár mentén
				if x != 0 or y != 0:  # Nem kell felülírni az aktuális csempét
					set_boundary(used_cell + Vector2i(x, y))
		#set_boundary(used_cell - Vector2i(0, 1))
		#set_boundary(used_cell - Vector2i(-1, 0))
		#set_boundary(used_cell - Vector2i(1, 0))
		#set_boundary(used_cell - Vector2i(0, -1))

func set_boundary(cell: Vector2i):
	if not get_cell_tile_data(cell):
		set_cell(cell, 1, Vector2i(0, 0))
