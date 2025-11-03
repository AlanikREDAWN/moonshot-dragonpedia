extends CharacterBody2D

var speed_x = 200
var speed_y = 100
var SPEED = 200.0
var target_position = null
var move_threshold = 1
var rotation_speed = 5
#var inputManager : InputManager
@onready var gameManager : gamemanager = get_parent() as gamemanager
@onready var cursor = get_node("Cursor")
var mouse_pos = Vector2()
const MOUSE_SPEED = 200.0
#@onready var direction = gameManager.inputManager.GetMovementVector()
#@onready var gameManager = get_parent()

func get_sprite_facing(radians):
	var octant = int(round(8 * rad_to_deg(radians) / 360 )) % 8
	match octant:
		0:
			#print("right")
			#$AnimatedSprite2D.flip_h = true
			#$AnimatedSprite2D.play("player_walk_side")
			return "Right"
		-1:
			#print("up-right")
			#$AnimatedSprite2D.flip_h = true
			#$AnimatedSprite2D.play("player_walk_half_up")
			return "UpRight"
		-2:
			#print("up")
			#$AnimatedSprite2D.flip_h = false
			#$AnimatedSprite2D.play("player_walk_back")
			return "Up"
		-3:
			#print("up-right")
			#$AnimatedSprite2D.flip_h = false
			#$AnimatedSprite2D.play("player_walk_half_up")
			return "UpLeft"
		1:
			#print("down-right")
			#$AnimatedSprite2D.flip_h = true
			#$AnimatedSprite2D.play("player_walk_half_down")
			return "DownRight"
		2:
			#print("down")
			#$AnimatedSprite2D.flip_h = false
			#$AnimatedSprite2D.play("player_walk_front")
			return "Down"
		3:
			#print("down-left")
			#$AnimatedSprite2D.flip_h = false
			#$AnimatedSprite2D.play("player_walk_half_down")
			return "DownLeft"
		_:
			#print("left")
			#$AnimatedSprite2D.flip_h = false
			#$AnimatedSprite2D.play("player_walk_side")
			return "Left"
			

func player_movement(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		target_position = get_global_mouse_position()
	#
	if target_position != null:
		pass
		#var direction = (target_position - global_position).normalized()
		#var distance = global_position.distance_to(target_position)
		#
		#print(direction)
		#
		#if distance < move_threshold:
			#target_position = null
			#$AnimatedSprite2D.play("player_idle_front")
			#velocity.x = 0
			#velocity.y = 0
		#else:
			#velocity.x = direction.x * speed_x
			#velocity.y = direction.y * speed_y
			#
			#if abs(direction.x) > abs(direction.y):
				#if direction.x > 0:
					#$AnimatedSprite2D.flip_h = true
					#$AnimatedSprite2D.play("player_walk_half_up")
				#else:
					#$AnimatedSprite2D.flip_h = false
					#$AnimatedSprite2D.play("player_walk_half_down")
			#else:
				#if direction.y > 0:
					#$AnimatedSprite2D.flip_h = false
					#$AnimatedSprite2D.play("player_walk_half_up")
				#else:
					#$AnimatedSprite2D.flip_h = true
					#$AnimatedSprite2D.play("player_idle_half_down")
			#
	
	else:
		
		
		
		#if gameManager and gameManager.inputManager:
			#var direction = gameManager.inputManager.GetMovementVector()
		#else:
			#push_error("gameManager or inputManager is null!")
			
			
		
		var direction2 = get_sprite_facing(8)
		# face right
		if direction2 == "Right":
			print("right")
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("player_walk_side")
		
		# face left
		if direction2 == "Left":
			print("left")
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("player_walk_side")
		
		# face up
		if direction2 == "Up":
			#print("up")
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("player_walk_back")
		
		# face down
		if direction2 == "Down":
			#print("down")
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("player_walk_front")
		
		# face up-right
		if direction2 == "UpRight":
			#print("up-right")
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("player_walk_half_up")
		
		# face up-left
		if direction2 == "UpLeft":
			#print("up-left")
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("player_walk_half_up")
		
		# face down-right
		if direction2 == "DownRight":
			#print("down-right")
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("player_walk_half_down")
		
		# face down-left
		if direction2 == "DownLeft":
			#print("down-left")
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("player_walk_half_down")
		
		
		
		#if velocity.y > 0:
			#direction = "south"
			#if velocity.x < 0:
				#direction = "southwest"
			#if velocity.x > 0:
				#direction = "southeast"
		#elif velocity.y < 0:
			#direction = "north"
			#if velocity.x < 0:
				#direction = "northwest"
			#if velocity.x > 0:
				#direction = "northeast"
		#elif: 
			#if velocity.x < 0:
				#direction = "west"
			#if velocity.x > 0:
				#direction = "east"
		var direction = gameManager.inputManager.GetMovementVector()
		##rotation = direction * rotation_speed * delta
		## face right
		#if direction == Vector2(1 ,0):
			#print("right")
			#$AnimatedSprite2D.flip_h = true
			#$AnimatedSprite2D.play("player_walk_side")
		#
		## face left
		#if direction == Vector2(-1, 0):
			#print("left")
			#$AnimatedSprite2D.flip_h = false
			#$AnimatedSprite2D.play("player_walk_side")
		#
		## face up
		#if direction == Vector2(0, -1):
			#print("up")
			#$AnimatedSprite2D.flip_h = false
			#$AnimatedSprite2D.play("player_walk_back")
		#
		## face down
		#if direction == Vector2(0, 1):
			#print("down")
			#$AnimatedSprite2D.flip_h = false
			#$AnimatedSprite2D.play("player_walk_front")
		#
		## face up-right
		#if direction == Vector2(1, -1):
			#print("up-right")
			#$AnimatedSprite2D.flip_h = true
			#$AnimatedSprite2D.play("player_walk_half_up")
		#
		## face up-left
		#if direction == Vector2(-1, -1):
			#print("up-right")
			#$AnimatedSprite2D.flip_h = false
			#$AnimatedSprite2D.play("player_walk_half_up")
		#
		## face down-right
		#if direction == Vector2(1, 1):
			#print("down-right")
			#$AnimatedSprite2D.flip_h = true
			#$AnimatedSprite2D.play("player_walk_half_down")
		#
		## face down-left
		#if direction == Vector2(-1, 1):
			#print("down-left")
			#$AnimatedSprite2D.flip_h = false
			#$AnimatedSprite2D.play("player_walk_half_down")
		
		#velocity = direction * SPEED
		
		if gameManager.inputManager.GetActionPressed("moveRight"):
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("player_walk_side")
			#velocity.x = speed_x
			#velocity.y = -speed_y
		elif gameManager.inputManager.GetActionReleased("moveRight"):
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("player_idle_side")
			#velocity.x = 0
			#velocity.y = 0
		elif gameManager.inputManager.GetActionPressed("moveLeft"):
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("player_walk_side")
			#velocity.x = -speed_x
			#velocity.y = speed_y
		elif gameManager.inputManager.GetActionReleased("moveLeft"):
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("player_idle_side")
			#velocity.x = 0
			#velocity.y = 0
		elif gameManager.inputManager.GetActionPressed("moveUp"):
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("player_walk_back")
			#velocity.x = -speed_x
			#velocity.y = -speed_y
		elif gameManager.inputManager.GetActionReleased("moveUp"):
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("player_idle_back")
			#velocity.x = 0
			#velocity.y = 0
		elif gameManager.inputManager.GetActionPressed("moveDown"):
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("player_walk_front")
			##velocity.x = speed_x
			#velocity.y = speed_y
		elif gameManager.inputManager.GetActionReleased("moveDown"):
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("player_idle_front")
			#velocity.x = 0
			#velocity.y = 0
		velocity = direction * SPEED
		pass
		
		#if gameManager.inputManager.GetActionPressed("moveRight"):
			#$AnimatedSprite2D.flip_h = true
			#$AnimatedSprite2D.play("player_walk_half_up")
			#velocity.x = speed_x
			#velocity.y = -speed_y
		#elif gameManager.inputManager.GetActionReleased("moveRight"):
			#$AnimatedSprite2D.flip_h = true
			#$AnimatedSprite2D.play("player_idle_half_up")
			#velocity.x = 0
			#velocity.y = 0
		#elif gameManager.inputManager.GetActionPressed("moveLeft"):
			#$AnimatedSprite2D.flip_h = false
			#$AnimatedSprite2D.play("player_walk_half_down")
			#velocity.x = -speed_x
			#velocity.y = speed_y
		#elif gameManager.inputManager.GetActionReleased("moveLeft"):
			#$AnimatedSprite2D.flip_h = false
			#$AnimatedSprite2D.play("player_idle_half_down")
			#velocity.x = 0
			#velocity.y = 0
		#elif gameManager.inputManager.GetActionPressed("moveUp"):
			#$AnimatedSprite2D.flip_h = false
			#$AnimatedSprite2D.play("player_walk_half_up")
			#velocity.x = -speed_x
			#velocity.y = -speed_y
		#elif gameManager.inputManager.GetActionReleased("moveUp"):
			#$AnimatedSprite2D.flip_h = false
			#$AnimatedSprite2D.play("player_idle_half_up")
			#velocity.x = 0
			#velocity.y = 0
		#elif gameManager.inputManager.GetActionPressed("moveDown"):
			#$AnimatedSprite2D.flip_h = true
			#$AnimatedSprite2D.play("player_walk_half_down")
			#velocity.x = speed_x
			#velocity.y = speed_y
		#elif gameManager.inputManager.GetActionReleased("moveDown"):
			#$AnimatedSprite2D.flip_h = true
			#$AnimatedSprite2D.play("player_idle_half_down")
			#velocity.x = 0
			#velocity.y = 0
			
			
			
			
		# controller support:
		#if Input.is_action_pressed("rigth")
		
		# computer support:
		#if Input.is_action_pressed("right"):
			#$AnimatedSprite2D.flip_h = true
			#$AnimatedSprite2D.play("player_walk_half_up")
			#velocity.x = speed_x
			#velocity.y = -speed_y
		#elif Input.is_action_just_released("right"):
			#$AnimatedSprite2D.flip_h = true
			#$AnimatedSprite2D.play("player_idle_half_up")
			#velocity.x = 0
			#velocity.y = 0
		#elif Input.is_action_pressed("left"):
			#$AnimatedSprite2D.flip_h = false
			#$AnimatedSprite2D.play("player_walk_half_down")
			#velocity.x = -speed_x
			#velocity.y = speed_y
		#elif Input.is_action_just_released("left"):
			#$AnimatedSprite2D.flip_h = false
			#$AnimatedSprite2D.play("player_idle_half_down")
			#velocity.x = 0
			#velocity.y = 0
		#elif Input.is_action_pressed("ui_up"):
			#$AnimatedSprite2D.flip_h = false
			#$AnimatedSprite2D.play("player_walk_half_up")
			#velocity.x = -speed_x
			#velocity.y = -speed_y
		#elif Input.is_action_just_released("ui_up"):
			#$AnimatedSprite2D.flip_h = false
			#$AnimatedSprite2D.play("player_idle_half_up")
			#velocity.x = 0
			#velocity.y = 0
		#elif Input.is_action_pressed("ui_down"):
			#$AnimatedSprite2D.flip_h = true
			#$AnimatedSprite2D.play("player_walk_half_down")
			#velocity.x = speed_x
			#velocity.y = speed_y
		#elif Input.is_action_just_released("ui_down"):
			#$AnimatedSprite2D.flip_h = true
			#$AnimatedSprite2D.play("player_idle_half_down")
			#velocity.x = 0
			#velocity.y = 0
			
	#else:
		#$AnimatedSprite2D.flip_h = false
		#$AnimatedSprite2D.play("player_idle_back")
		
		
	move_and_slide()
	
func _physics_process(delta: float) -> void:
	player_movement(delta)
	
	#var mp = get_global_mouse_position()
	#
	#var left_stick_vector = Input.get_vector("mouseLeft", "mouseRight", "mouseUp", "mouseDown")
	##print(left_stick_vector)
	#
	#get_viewport().warp_mouse(round(get_global_mouse_position() + left_stick_vector*MOUSE_SPEED*delta))
	#pass
	#var new_mouse_pos = get_global_mouse_position() + left_stick_vector * MOUSE_SPEED
	
	#get_viewport().warp_mouse(new_mouse_pos)
	
	#var direction = gameManager.inputManager.GetMovementVector()
		#
	#velocity = direction * SPEED
	
	
func _ready() -> void:
	#super._ready()
	await get_tree().physics_frame
	print(gameManager.inputManager)
	
	#inputManager = get_parent().inputManager
	#print(gameManager.get_class())
	#if not gameManager.is_node_ready():
		#await gameManager.ready  # Wait for the node to be ready
		## Now it's safe to access my_node
		#print(gameManager)
	pass



func _process(delta: float) -> void:
	pass
