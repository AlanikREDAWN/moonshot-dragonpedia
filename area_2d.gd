#extends Area2D
#
#@export var tilemap: TileMap
#
## Define the atlas coords of water and ice tiles
#const WATER_ATLAS_COORDS = Vector2i(4, 10)
#const ICE_ATLAS_COORDS = Vector2i(6, 2)
#const TILE_SOURCE_ID = 0  # Usually 0 unless you added extra sources
#
#func _physics_process(delta):
	#freeze_tile_under()
	#
##func freeze_tile_under():
	##var cell = tilemap.local_to_map(global_position)
	##var layer = 0
##
	##var current_source_id = tilemap.get_cell_source_id(layer, cell)
	##var current_atlas_coords = tilemap.get_cell_atlas_coords(layer, cell)
##
	##if current_source_id == TILE_SOURCE_ID and current_atlas_coords == WATER_ATLAS_COORDS:
		##tilemap.set_cell(layer, cell, TILE_SOURCE_ID, ICE_ATLAS_COORDS)
#func freeze_tile_under():
	#var cell = tilemap.local_to_map(global_position)
##
	##var current_source_id = tilemap.get_cell_source_id(cell)
	##var current_atlas_coords = tilemap.get_cell_atlas_coords(cell)
##
	##if current_source_id == TILE_SOURCE_ID and current_atlas_coords == WATER_ATLAS_COORDS:
		##tilemap.set_cell(0, cell, TILE_SOURCE_ID, ICE_ATLAS_COORDS)
#
#
#extends Area2D
#
##@export var tilemap: TileMap
##@export var water_layer: TileMapLayer  # Assigned in the inspector
#
##@export var water_layer = $TileMapLayer2  # Assigned in the inspector
#@onready var water_layer: TileMapLayer = $"../../../../../TileMapLayer2"
#
#func _ready():
#
	#var cell = water_layer.local_to_map(global_position)
	#var current_source = water_layer.get_cell_source_id(cell)
	#var atlas_coords = water_layer.get_cell_atlas_coords(cell)
#
#
#const WATER_ATLAS_COORDS = Vector2i(3, 2)
#const ICE_ATLAS_COORDS = Vector2i(5, 2)
#const TILE_SOURCE_ID = 0  # usually 0 unless you added multiple sources
#
##
##func _ready():
	##if tilemap == null:
		##push_error("TileMap is not assigned!")
#
#func _physics_process(delta):
	#freeze_tile_under()
#
#func freeze_tile_under():
	#var cell: Vector2i = water_layer.local_to_map(global_position)
#
	## Get the current tile at that cell
	##var cell_data = water_layer.get_cell_tile_data(0, cell)
	#var cell_data = water_layer.get_cell_tile_data(cell)
	#if cell_data == null:
		#return  # Nothing here to freeze
#
	##var current_source_id = water_layer.get_cell_source_id(0, cell)
	#var current_source_id = water_layer.get_cell_source_id(cell)
	##var current_atlas_coords = water_layer.get_cell_atlas_coords(0, cell)
	#var current_atlas_coords = water_layer.get_cell_atlas_coords(cell)
#
	#if current_source_id == TILE_SOURCE_ID and current_atlas_coords == WATER_ATLAS_COORDS:
		##water_layer.set_cell(0, cell, TILE_SOURCE_ID, ICE_ATLAS_COORDS)
		#water_layer.set_cell(cell, TILE_SOURCE_ID, ICE_ATLAS_COORDS)

#extends Node2D
#
#@export var ice_tile_id: int = 1  # Tile ID for ice
#@export var water_tile_id: int = 0  # Tile ID for water
#var tilemap_layer: TileMapLayer
#var particle_system: GPUParticles2D
#
## Called when the node enters the scene tree for the first time
#func _ready():
	#tilemap_layer = $TileMapLayer  # Reference to the TileMapLayer node
	#particle_system = $GPUParticles2D  # Reference to the Particles2D node
#
	## Connect particle system signal
	#particle_system.connect("area_entered", self, "_on_particle_hit")
#
## Function to handle the particle hitting a tile
#func _on_particle_hit(area: Area2D):
	#var tile_pos = world_to_map(area.position)  # Get the tile position
	#var current_tile = tilemap_layer.get_cellv(tile_pos)
#
	#if current_tile == water_tile_id:
		## Change the water tile to ice
		#tilemap_layer.set_cellv(tile_pos, ice_tile_id)
#
#
#func _on_area_entered(area: Area2D) -> void:
	#pass # Replace with function body.
	
#extends Area2D
#
#tilemap = $"../../../../../TileMapLayer2"
#
#func _on_area_entered(area: Area2D) -> void:
	#tilemap.collision_
