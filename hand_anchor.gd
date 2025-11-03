class_name HandAnchor
extends Node2D

@export var default_direction = Vector2.RIGHT

@onready var cursor = get_node("Cursor")
var mouse_pos = Vector2()
const MOUSE_SPEED = 800.0
@export var RADIUS = 70
@export var DEAD_ZONE = 0.1
#@onready var gameManager : gamemanager = get_parent() as gamemanager
@export var gameManagerlevel : gamemanagerlevel = get_parent() as gamemanagerlevel
#var mouse_pos = Vector2()

var connectedControllers = {}
var activeController = -1

@export var analogDeadzone = 0.2
@export var triggerThreshold = 0.5

func _input(event: InputEvent) -> void:
	pass


func _ready() -> void:
	#var signalname = get_tree().create_timer(1.0).timeout
	#await signalname
#
	#if game_manager_path:
		#print("Game manager path: ", game_manager_path) #Print Path
		#var gameManagerlevel1 = get_node(game_manager_path)
		#if gameManagerlevel1:
			#print("Game manager found.")
			#if gameManagerlevel1.has_node("InputManager"):
				#print(gameManagerlevel1.inputManager)
			#else:
				#print("Input Manager not found.")
		#else:
			#print("Could not retrieve the Game Manager Node.")
	#else:
		#print("Please set the Game Manager Node Path.")
#
	#pass
	
	#var signalname = get_tree().create_timer(1.0).timeout
	#await signalname
	#await get_tree().physics_frame
	#if gameManagerlevel1 == null:
		#print("gameManagerlevel1 is null!")
		#return # Stop execution if it is null
	#print(gameManagerlevel1.inputManager)
	#pass
	
	#await get_tree().advance_scene()
	
	#var signalname = get_tree().create_timer(1.0).timeout
	#await signalname
	#await get_tree().physics_frame
	#await get_tree().process_frame
	#get_tree().physics_frame
	#print(gameManagerlevel1.inputManager)
	pass # Replace with function body.

#func _input(event):
	#if event is InputEventMouseMotion:
		#mouse_pos = event.position
		
		

func GetControllerStickInput(deviceid = -1, leftstick = true):
	if deviceid == -1:
		deviceid = activeController
	if deviceid == -1 or not connectedControllers.has(deviceid):
		return Vector2.ZERO
	
	var xAxies = JOY_AXIS_LEFT_X if leftstick else JOY_AXIS_RIGHT_X
	var yAxies = JOY_AXIS_LEFT_Y if leftstick else JOY_AXIS_RIGHT_Y

	var inputVector = Vector2(
		Input.get_joy_axis(deviceid, xAxies), 
		Input.get_joy_axis(deviceid, yAxies)
		)
		
	if inputVector.length() < analogDeadzone:
		return  Vector2.ZERO
	return inputVector
func _physics_process(delta: float) -> void:
	var mp = get_global_mouse_position()
	
	var left_stick_vector = Input.get_vector("mouseLeft", "mouseRight", "mouseUp", "mouseDown")
	#print(left_stick_vector)
	
	get_viewport().warp_mouse(round(get_global_mouse_position() + left_stick_vector*MOUSE_SPEED*delta))
	
	print(get_global_mouse_position() - mp)
	pass
	#await get_tree().create_timer(0.1).timeout
	#await get_tree().physics_frame
	var cursor_position = get_global_mouse_position()
	#var direction_to_cursor = global_position.direction_to(cursor_position)
	#
	#get_viewport().warp_mouse(get_global_mouse_position() + gameManagerlevel1.inputManager.GetMovementVector() * MOUSE_SPEED * delta)
	#
	#
	var rotation_angle = global_position.angle_to_point(cursor_position)
	rotation = rotation_angle

func _process(delta: float) -> void:
	pass
	#var mouse_rel = Vector2.ZERO
	#if Input.is_action_pressed("mouse_up"):
		#mouse_rel += Vector2.UP * mouse_speed
	#elif Input.is_action_pressed("mouse_down"):
		#mouse_rel += Vector2.DOWN * mouse_speed
	#elif Input.is_action_pressed("mouse_left"):
		#mouse_rel += Vector2.LEFT * mouse_speed
	#elif Input.is_action_pressed("mouse_right"):
		#mouse_rel += Vector2.RIGHT * mouse_speed
	#if mouse_rel != Vector2.ZERO:
		#Input.warp_mouse_position(mouse_pos + mouse_rel)
	#cursor.position = get_global_mouse_position()
	
	#var cursor_position = get_global_mouse_position()
	#var direction_to_cursor = global_position.direction_to(cursor_position)
	#
	##get_viewport().warp_mouse(cursor_position + gameManagerlevel1.inputManager.GetMovementVector() * MOUSE_SPEED * delta)
	#get_viewport().warp_mouse(GetControllerStickInput())
	#
	#var rotation_angle = global_position.angle_to_point(cursor_position)
	#rotation = rotation_angle
