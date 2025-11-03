extends CharacterBody2D

#var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


#
#var velocity = Vector2()

#func _physics_process(delta):
	#var collision = move_and_collide(velocity * delta)
	#if collision:
		#print("collision")
		#if collision.get_collider() is TileMap:
			#print("tilemap detected")
			#var ray = RayCast2D.new()
			#ray.enabled = true
			#ray.cast_to = velocity
			#add_child(ray)
			#ray.force_raycast_update()
			#if ray.is_colliding():
				#var tilemap = ray.get_collider()
				#var collision_point = ray.get_collision_point()
				#var cell_vec = tilemap.world_to_map(collision_point)
				#if tilemap.name == "TileMapWater":
					#tilemap.set_cellv(cell_vec, -1)
				#queue_free()
		#
