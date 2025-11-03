extends Area2D

var character_name : String = "Dragon"
var dragonNumber : int = 0015

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
	#EventHandler.emit_signal("identify0109_started", character_name, dragonNumber)
		EventHandler.emit_signal("identify_started", character_name, dragonNumber)
	pass # Replace with function body.
