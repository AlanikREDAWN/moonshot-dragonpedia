extends TileMapLayer
#
@onready var tile = $"."
@onready var iceCollision = $"../player/HandAnchor/ice/ice/iceCollision"
#func _process_physics(delta):
	#for body in tile.get_overlapping_areas():
		#if !body.is_in_group("player"):
			#print("collisions!")
			#
	#if tile.has_overlapping_areas():
		#print("collisions!")
			#
#var waterArea = preload("res://water_area.tscn")
#var level1 = preload("res://level1.tscn")
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	##var used_water_tiles = get_used_cells_by_id(0)
	##print(used_water_tiles)
	##
	##print(map_to_local(used_water_tiles[0]))
	##
	##print(get_cell_atlas_coords(Vector2i(14,17)))
	#var used_water_tiles = get_used_cells()
	#for tile in used_water_tiles:
		##if get_cell_atlas_coords(Vector2i(tile[0], tile[1])) == Vector2i(0, 0) or get_cell_atlas_coords(Vector2i(tile[0], tile[1])) == Vector2i(2, 0):
			##var level1_instance = level1.instantiate()
			##level1_instance.position = map_to_local(tile)
			##var waterArea_instance = waterArea.instantiate()
			##waterArea_instance.position = map_to_local(tile)
		#var waterArea_instance = waterArea.instantiate()
		#waterArea_instance.position = map_to_local(tile)
			#
	##for area in get_tree().get_nodes_in_group("waterArea"):
		##area.connect(body_entered, OnWaterAreaEntered)
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

#
#func _on_ice_collision_body_entered(body: Node2D) -> void:
	#var normal = body.get_collision
