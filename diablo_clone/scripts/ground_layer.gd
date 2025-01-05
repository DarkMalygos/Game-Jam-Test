extends TileMapLayer

func _ready() -> void:
	create_cell_boundaries()
	
func create_cell_boundaries():
	var used_cells = get_used_cells()
	
	for used_cell in used_cells:
		set_boundary(used_cell - Vector2i(0, 1))
		set_boundary(used_cell - Vector2i(-1, 0))
		set_boundary(used_cell - Vector2i(1, 0))
		set_boundary(used_cell - Vector2i(0, -1))

func set_boundary(cell: Vector2i):
	if not get_cell_tile_data(cell):
		set_cell(cell, 0, Vector2i(7, 0))
