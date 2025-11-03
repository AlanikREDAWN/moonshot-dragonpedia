extends Area2D

@onready var tilemapWater = $"../../../../../TileMapWater"
@onready var iceCollision = $"."
#var velocity = Vector2()
#const WATER_ATLAS_COORDS = Vector2i(4, 10)
#const ICE_ATLAS_COORDS = Vector2i(6, 2)
#const TILE_SOURCE_ID = 0
#
#func freeze_tile():
	#var cell = tilemapWater.local_to_map(global_position)
	#var layer = 0
	#
	#var current_source_id = tilemapWater.get_cell_source_id(cell)
	#var current_atlas_coords = tilemapWater.get_cell_atlas_coords(cell)
	#
	#if current_source_id == TILE_SOURCE_ID and current_atlas_coords == WATER_ATLAS_COORDS:
		#tilemapWater.set_cell(layer, cell, TILE_SOURCE_ID, ICE_ATLAS_COORDS)
# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	##tilemapWater.collision_enabled = false
	#tilemapWater.use_kinematic_bodies = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
	
#func _physics_process(delta: float) -> void:
	#var collision = move_and_collide

#func _physics_process(delta: float) -> void:
	#freeze_tile()
#func global_rect_to_map(rect: Rect2) -> Rect2i:
	#var rect_map: Rect2i
	#rect_map.position = local_to_map(to_local(rect.position))
	#rect_map.size = local_to_map(to_local(rect.position + rect.size)) - rect_map.position + Vector2i(1, 1)
	#return rect_map

#func _on_area_entered(area: Area2D) -> void:
	#tilemapWater.set_cell()
	#var collision_position = area

#func _on_body_entered(body: Node2D) -> void:
	
	#if !body.is_in_group("player"):
		#tilemapWater.get_coords_for_body_rid($CollisionShape2D.rid)
	#var area_rect_global: Rect2
	#area_rect_global.position = $".".to_global($"."/"CollisionShape2D".position - $"."/"CollisionShape2D".shape.size * .5)
	#area_rect_global.size = $".".to_global($"."/"CollisionShape2D".position + $"."/"CollisionShape2D".shape.size * .5) - area_rect_global.position
	#
	#for j in area_rect_global.size.y:
		#for i in area_rect_global.size.x:
			#var v = Vector2i(area_rect_global.position) + Vector2i(i,j)
			#$"../../../../../TileMapWater".set_cell(v, 0, Vector2i(0,0), -1)
			#tilemapWater.erase_cell(v)
	#position = body.to_global(body.global_position)
	#var tile_position = tilemapWater.map_to_local(position)
	
	
	#var tile = tilemapWater.map_to_local(body.global_position)
	#var tile_position = tilemapWater.local_to_map(tile)
	
	#print("Body entered:", body.name)
	#if !body.is_in_group("player"):
		#tilemapWater.clear()
		
		
		#tilemapWater.erase_cell(tile_position)
		#print(tile_position)
	#var tile_position = tilemapWater.local_to_map(body.global_position)
	##tilemapWater.set_cell(tile_position)
	#print(tile_position)
	#tilemapWater.erase_cell(tile_position)
	#if body.is_in_group("ice"):
		#tilemapWater.clear()
		
		
#func _physics_process(delta):
	#if $RayCast2D.is_colliding():
		#print("colliding")
		#var collision_point = $RayCast2D.get_collision_point()
		#var cell = tilemapWater.local_to_map(collision_point) / 2
		#var tile_data = tilemapWater.get_cell_tile_data(cell)
#
		#if tile_data and tile_data.get_custom_data("type") == "water":
			#print("raycast hit water tile")

#func _physics_process(delta):
	#if $RayCast2D.is_colliding():
		##print("colliding")
		#var collision_point = $RayCast2D.get_collision_point()
		#var cell = tilemapWater.local_to_map(collision_point)
		#var tile_data = tilemapWater.get_cell_tile_data(cell)
		#
		#if tile_data and tile_data.get_custom_data("type") == "water":
			#print("raycast hit water tile")

		#
#func _physics_process(delta: float) -> void:
	#var cell_pos = tilemapWater.local_to_map(iceCollision.global_position)
	#var tile_id = tilemapWater.get_cell_source_id(cell_pos)
	#
	#if tile_id != -1:
		#print("wow - on tile", tile_id)

#func _physics_process(delta: float) -> void:
	#if iceCollision.overlaps_body(tilemapWater):
		#print("wow")
		#
	#for body in iceCollision.get_overlapping_bodies():
		##if !body.is_in_group("player"):
		#print("collisions!")
			#
	#if iceCollision.has_overlapping_bodies():
		#print("collisions!")
	
			

#func _on_area_entered(area: Area2D) -> void:
	#var pos = tilemapWater.local_to_map(iceCollision.global_position)
	#tilemapWater.erase_cell(pos)
	#print(pos)
#
#
#func _on_body_entered(body: Node2D) -> void:
	#var pos = tilemapWater.local_to_map(iceCollision.global_position)
	#var accuratePos = pos / 2
	#tilemapWater.erase_cell(accuratePos)
	#print(accuratePos)
