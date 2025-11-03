#extends CharacterBody2D
#
#
#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
#
#
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

extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0
var speed_x = 200
var speed_y = 100
var target_position = null
var move_threshold = 1
var jumpspeed : float = 128
var gravity : float = 9.81
var vertical_velocity : float = 0
#var wall_jump_pushback = 100
@onready var gameManagerlevel : gamemanagerlevel = get_parent() as gamemanagerlevel



func player_movement(delta):
	#if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		#target_position = get_global_mouse_position()
	
	#if target_position != null:
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
	
	#else:
	
	if gameManagerlevel.inputManager.GetActionPressed("moveRight"):
		#$AnimatedSprite2D.flip_h = true
		#$AnimatedSprite2D.play("player_walk_half_up")
		#velocity.x = speed_x
		#velocity.y = -speed_y
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("player_walk_side")
		velocity.x = speed_x
	elif gameManagerlevel.inputManager.GetActionReleased("moveRight"):
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("player_idle_side")
		velocity.x = 0
		velocity.y = 0
	elif gameManagerlevel.inputManager.GetActionPressed("moveLeft"):
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("player_walk_side")
		velocity.x = -speed_x
	elif gameManagerlevel.inputManager.GetActionReleased("moveLeft"):
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("player_idle_side")
		velocity.x = 0
		velocity.y = 0
	#if Input.is_action_pressed("right"):
		##$AnimatedSprite2D.flip_h = true
		##$AnimatedSprite2D.play("player_walk_half_up")
		##velocity.x = speed_x
		##velocity.y = -speed_y
		#$AnimatedSprite2D.flip_h = true
		#$AnimatedSprite2D.play("player_walk_side")
		#velocity.x = speed_x
	#elif Input.is_action_just_released("right"):
		#$AnimatedSprite2D.flip_h = true
		#$AnimatedSprite2D.play("player_idle_side")
		#velocity.x = 0
		#velocity.y = 0
	#elif Input.is_action_pressed("left"):
		#$AnimatedSprite2D.flip_h = false
		#$AnimatedSprite2D.play("player_walk_side")
		#velocity.x = -speed_x
	#elif Input.is_action_just_released("left"):
		#$AnimatedSprite2D.flip_h = false
		#$AnimatedSprite2D.play("player_idle_side")
		#velocity.x = 0
		#velocity.y = 0
	
	if not is_on_floor():
		#if Global.gravity_flipped == false:
		velocity += get_gravity() * delta
	if gameManagerlevel.inputManager.GetActionPressed("actionJump"):
		if is_on_floor():
		#if Global.gravity_flipped == false:
			velocity.y = JUMP_VELOCITY
		#if Input.is_action_just_pressed("ui_up"):
			#vertical_velocity = -jumpspeed
		#else:
			#vertical_velocity += gravity * delta
		#$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("player_idle_front")
		#if is_on_wall() and gameManagerlevel.inputManager.GetActionPressed("moveRight"):
			#velocity.y = JUMP_VELOCITY
			#velocity.x = -wall_jump_pushback
		#if is_on_wall() and gameManagerlevel.inputManager.GetActionPressed("moveLeft"):
			#velocity.y = JUMP_VELOCITY
			#velocity.x = wall_jump_pushback
	#
	#if Input.is_action_pressed("right"):
		##$AnimatedSprite2D.flip_h = true
		##$AnimatedSprite2D.play("player_walk_half_up")
		##velocity.x = speed_x
		##velocity.y = -speed_y
		#$AnimatedSprite2D.flip_h = true
		#$AnimatedSprite2D.play("player_walk_side")
		#velocity.x = speed_x
	#elif Input.is_action_just_released("right"):
		#$AnimatedSprite2D.flip_h = true
		#$AnimatedSprite2D.play("player_idle_side")
		#velocity.x = 0
		#velocity.y = 0
	#elif Input.is_action_pressed("left"):
		#$AnimatedSprite2D.flip_h = false
		#$AnimatedSprite2D.play("player_walk_side")
		#velocity.x = -speed_x
	#elif Input.is_action_just_released("left"):
		#$AnimatedSprite2D.flip_h = false
		#$AnimatedSprite2D.play("player_idle_side")
		#velocity.x = 0
		#velocity.y = 0
	#if Input.is_action_pressed("right"):
		##$AnimatedSprite2D.flip_h = true
		##$AnimatedSprite2D.play("player_walk_half_up")
		##velocity.x = speed_x
		##velocity.y = -speed_y
		#$AnimatedSprite2D.flip_h = true
		#$AnimatedSprite2D.play("player_walk_side")
		#velocity.x = speed_x
	#elif Input.is_action_just_released("right"):
		#$AnimatedSprite2D.flip_h = true
		#$AnimatedSprite2D.play("player_idle_side")
		#velocity.x = 0
		#velocity.y = 0
	#elif Input.is_action_pressed("left"):
		#$AnimatedSprite2D.flip_h = false
		#$AnimatedSprite2D.play("player_walk_side")
		#velocity.x = -speed_x
	#elif Input.is_action_just_released("left"):
		#$AnimatedSprite2D.flip_h = false
		#$AnimatedSprite2D.play("player_idle_side")
		#velocity.x = 0
		#velocity.y = 0
	#
	#if not is_on_floor():
		##if Global.gravity_flipped == false:
		#velocity += get_gravity() * delta
	#if Input.is_action_just_pressed("jump"):
		#if is_on_floor():
		##if Global.gravity_flipped == false:
			#velocity.y = JUMP_VELOCITY
		##if Input.is_action_just_pressed("ui_up"):
			##vertical_velocity = -jumpspeed
		##else:
			##vertical_velocity += gravity * delta
		##$AnimatedSprite2D.flip_h = false
			#$AnimatedSprite2D.play("player_idle_front")
		#if is_on_wall() and Input.is_action_just_pressed("right"):
			#velocity.y = JUMP_VELOCITY
			#velocity.x = -wall_jump_pushback
		#if is_on_wall() and Input.is_action_just_pressed("left"):
			#velocity.y = JUMP_VELOCITY
			#velocity.x = wall_jump_pushback

	
		#velocity.x = -speed_x
		#velocity.y = speed_y
	#elif Input.is_action_just_released("ui_up"):
		##$AnimatedSprite2D.flip_h = false
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
	#move_and_collide(vertical_velocity)

var fire = preload("res://fire2.tscn").instantiate()
@onready var fireNode = get_parent().get_node('%GPUParticles2Dfire')
var ice = preload("res://ice.tscn").instantiate()
@onready var iceNode = get_parent().get_node('%GPUParticles2Dice')
func _physics_process(delta: float) -> void:
	player_movement(delta)
#	
#@onready var fireNode = null
#@onready var iceNode = null
func _ready() -> void:
	await get_tree().physics_frame
	print(gameManagerlevel.inputManager)

	var parent = get_parent()
	if parent:
		fireNode = parent.get_node('%GPUParticles2Dfire')
		iceNode = parent.get_node('%GPUParticles2Dice')
	else:
		print("error")
	var fireNode = get_parent().get_node('%GPUParticles2Dfire')
	var iceNode = get_parent().get_node('%GPUParticles2Dice')
	await get_tree().physics_frame
	print(gameManagerlevel.inputManager)
	$HandAnchor/ice/ice/iceCollision/CollisionShape2D.disabled = true
	$HandAnchor/fire/fire_breath/fireCollision/CollisionShape2D.disabled = true
	#fire.get_node("/root/EventHandler")
	
	
	#if is_instance_valid(fireNode):
		#fireNode.emission = false
	#else:
		#print("Error: GPUParticles2Dfire not found or invalid.")
	#%GPUParticles2Dfire.emission = false
	
	#$HandAnchor/ice/ice/iceCollisionBody/RayCast2D2.enabled = false
	
	#FireParticles.emitting = false
	#IceParticles.emitting = false

var element = null
#var fireNode = get_parent().get_node('%GPUParticles2Dfire')

#var iceNode = get_parent().get_node('%GPUParticles2Dice')
func _process(delta: float) -> void:
	#var fireNode = get_parent().get_node('%GPUParticles2Dfire')
	#var iceNode = get_parent().get_node('%GPUParticles2Dice')
	
	if element == null:
		if gameManagerlevel.inputManager.GetActionPressed("fire"):
			gameManagerlevel.inputManager.RumbleController(0.5, 0.7)
			
			$HandAnchor/fire.visible = true
			
			$HandAnchor/fire/fire_breath/fireCollision/CollisionShape2D.disabled = false
			element = "fire"
			
			#FireParticles.emitting = true

		if gameManagerlevel.inputManager.GetActionPressed("ice"):
			gameManagerlevel.inputManager.RumbleController(0.5, 0.7)
			
			$HandAnchor/ice.visible = true
			#$HandAnchor/ice/ice/iceCollisionBody/RayCast2D2.enabled = true
			$HandAnchor/ice/ice/iceCollision/CollisionShape2D.disabled = false
			element = "ice"
			
			#IceParticles.emitting = true

			
	if gameManagerlevel.inputManager.GetActionReleased("fire"):
		$HandAnchor/fire.visible = false
		
		
		$HandAnchor/fire/fire_breath/fireCollision/CollisionShape2D.disabled = true
		element = null
		
		#FireParticles.emitting = false
	if gameManagerlevel.inputManager.GetActionReleased("ice"):
		$HandAnchor/ice.visible = false
		
		#$HandAnchor/ice/ice/iceCollisionBody/RayCast2D2.enabled = false
		$HandAnchor/ice/ice/iceCollision/CollisionShape2D.disabled = true
		element = null
		
		#IceParticles.emitting = false
		
	#if element == null:
		#if Input.is_action_pressed("fire"):
			#$HandAnchor/fire.visible = true
			#
			#$HandAnchor/fire/fire_breath/fireCollision/CollisionShape2D.disabled = false
			#element = "fire"
#
		#if Input.is_action_pressed("ice"):
			#$HandAnchor/ice.visible = true
			##$HandAnchor/ice/ice/iceCollisionBody/RayCast2D2.enabled = true
			#$HandAnchor/ice/ice/iceCollision/CollisionShape2D.disabled = false
			#element = "ice"
#
			#
	#if Input.is_action_just_released("fire"):
		#$HandAnchor/fire.visible = false
		#
		#$HandAnchor/fire/fire_breath/fireCollision/CollisionShape2D.disabled = true
		#element = null
	#if Input.is_action_just_released("ice"):
		#$HandAnchor/ice.visible = false
		##$HandAnchor/ice/ice/iceCollisionBody/RayCast2D2.enabled = false
		#$HandAnchor/ice/ice/iceCollision/CollisionShape2D.disabled = true
		#element = null
