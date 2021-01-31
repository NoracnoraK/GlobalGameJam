extends Node2D

signal coin_add(val)
signal crown_win(val)
signal ruby_add(val)

var pos_crown

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
			c.connect("coin_collected", self, "_on_coin_picked")
		elif (type in ['Ruby']):
			var itm = preload("res://Scene/Ruby.tscn")
			var pos = $TileMap5.map_to_world(cell)
			pos = pos + $TileMap5.position
			var c = itm.instance()
			c.init(type, pos + $TileMap5.cell_size/2)
			add_child(c)
			c.connect("ruby_collected", self, "_on_ruby_picked")
		elif (type in ['Crown']):
			var itm = preload("res://Scene/Area2D.tscn")
			var pos = $TileMap5.map_to_world(cell)
			pos = pos + $TileMap5.position
			pos_crown = pos
			var c = itm.instance()
			c.init(type, pos + $TileMap5.cell_size/2)
			add_child(c)
			c.connect("crown_collected", self, "_on_crow_picked")
			
func _on_coin_picked(body):
	emit_signal("coin_add", 1)
	
func _on_crow_picked(body):
	emit_signal("crown_win", 1)
	pos_crown.y -= 50
	$Label.set_position(pos_crown)
	$Label.text = "You Win!\n The Game will stop."
	$Timer.start()

func _on_ruby_picked(body):
	emit_signal("ruby_add", 1)


func _on_Timer_timeout():
	get_tree().quit()
	pass # Replace with function body.
