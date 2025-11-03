#extends CharacterBody2D
#
#
#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
var velocity = Vector2()

var ice = $"."
func _physics_process(delta):
	var collision = ice.move_and_collide(velocity * delta)
	if collision:
		if collision.collider is TileMap:
			var ray = RayCast2D.new()
			ray.enabled = true
			ray.cast_to = velocity
			add_child(ray)
			ray.force_raycast_update()
			if ray.is_colliding():
				var tilemap = ray.get_collider()
				var collision_point = ray.get_collision_point()
				var cell_vec = tilemap.world_to_map(collision_point)
				if tilemap.name == "Town Tilemap":
					tilemap.set_cellv(cell_vec, -1)
				queue_free()
#func _physics_process(delta: float) -> void:
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
