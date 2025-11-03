extends Area2D

#@onready var map = preload("res://map.gd").instantiate()
@onready var map = preload("res://map.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://map.tscn")
		#get_parent().add_child(map)
		#get_parent().remove_child(self)
