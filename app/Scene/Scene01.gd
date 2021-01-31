extends Node2D

func _ready():
	spawn_item()
	$TileMap5.hide()
	pass # Replace with function body.

func spawn_item():
	for cell in $TileMap5.get_used_cells():
		var id = $TileMap5.get_cellv(cell)
		var type = $TileMap5.tile_set.tile_get_name(id)
		if (type in ['Coin']):
			var itm = preload("res://Scene/Coin.tscn")
			var pos = $TileMap5.map_to_world(cell)
			pos = pos + $TileMap5.position
			var c = itm.instance()
			c.init(type, pos + $TileMap5.cell_size/2)
			add_child(c)
		elif (type in ['Ruby']):
			var itm = preload("res://Scene/Ruby.tscn")
			var pos = $TileMap5.map_to_world(cell)
			pos = pos + $TileMap5.position
			var c = itm.instance()
			c.init(type, pos + $TileMap5.cell_size/2)
			add_child(c)
		elif (type in ['Crown']):
			var itm = preload("res://Scene/Area2D.tscn")
			var pos = $TileMap5.map_to_world(cell)
			pos = pos + $TileMap5.position
			var c = itm.instance()
			c.init(type, pos + $TileMap5.cell_size/2)
			add_child(c)
