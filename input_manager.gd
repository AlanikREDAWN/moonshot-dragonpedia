extends Node
class_name InputManager

enum InputSource {KEYBOARD, CONTROLLER, TOUCH}

var activeInputSource = InputSource.KEYBOARD

signal InputSourceChanged(source)
@onready var controllerManager = $ControllerManager

func _ready():
	controllerManager.ControllerConnected.connect(onControllerConnected)
	controllerManager.ControllerDisconnected.connect(onControllerDisconnected)
	
func detectInitialInputSource():
	if controllerManager.activeController != -1:
		setInputSource(InputSource.KEYBOARD)
	else:
		setInputSource(InputSource.CONTROLLER)

func GetMovementVector():
	if activeInputSource == InputSource.KEYBOARD:
		return Input.get_vector("moveLeft", "moveRight", "moveUp", "moveDown")
	if activeInputSource == InputSource.CONTROLLER:
		return controllerManager.GetControllerStickInput()
	return 0

func GetActionPressed(actionName):
	return Input.is_action_pressed(actionName)
	
func GetActionReleased(actionName):
	return Input.is_action_just_released(actionName)

func _input(event: InputEvent) -> void:
	if event is InputEventKey or event is InputEventMouse:
		setInputSource(InputSource.KEYBOARD)
	if event is InputEventJoypadButton or event is InputEventJoypadMotion:
		setInputSource((InputSource.CONTROLLER))
		
func setInputSource(source):
	if activeInputSource != source:
		activeInputSource = source
		print("Input Source has changed to : ", source)
		InputSourceChanged.emit(source)
	#if activeInputSource

func onControllerConnected(id):
	setInputSource(InputSource.CONTROLLER)
	pass

func onControllerDisconnected(id):
	setInputSource(InputSource.KEYBOARD)
	pass
	
func RumbleController(intensity = .5, duration = .5, id = -1):
	if activeInputSource == InputSource.CONTROLLER:
		controllerManager.RumbleController(intensity, duration, id)
