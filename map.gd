extends Node2D
class_name gamemanager

@onready var inputManager = $InputManager



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	if EventHandler.dragon0109 == true:
		$dragon0109.queue_free()
	if EventHandler.dragon0113 == true:
		$dragon0113.queue_free()
	if EventHandler.dragon0015 == true:
		$dragon0015.queue_free()
	if EventHandler.dragon0032 == true:
		$dragon0032.queue_free()
	if EventHandler.dragon0115 == true:
		$dragon0115.queue_free()
	if EventHandler.dragon0114 == true:
		$dragon0114.queue_free()
	if EventHandler.dragon0104 == true:
		$dragon0104.queue_free()
	$player/Camera2D/CanvasLayer/identify_dragon0109/Panel/identify_button.grab_focus()
	$music.playing = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if DisplayServer.window_get_mode() == 3:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$player/Camera2D/Label.text = "Dragons Identified: %s/%s" %[EventHandler.dragonsIdentified, EventHandler.totalDragons]


	#print(get_global_mouse_position() - mp)
	#pass
	#await get_tree().create_timer(0.1).timeout
	#await get_tree().physics_frame
	#var cursor_position = get_global_mouse_position()
	#var direction_to_cursor = global_position.direction_to(cursor_position)
	#
	#get_viewport().warp_mouse(get_global_mouse_position() + gameManagerlevel1.inputManager.GetMovementVector() * MOUSE_SPEED * delta)
	#
	#
	#var rotation_angle = global_position.angle_to_point(cursor_position)
	#rotation = rotation_angle
