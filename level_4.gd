extends gamemanagerlevel
#class_name gamemanagerlevel
#@export var
#@onready var inputManager = $InputManager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$musicLevel.playing = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if inputManager.GetActionPressed("restart"):
		get_tree().reload_current_scene()
