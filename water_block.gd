extends Area2D

@onready var ice = $ice
@onready var water = $water
@onready var iceCollision = $ice/StaticBody2D/CollisionShape2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	print("body detected")
	if body.is_in_group("ice"):
		print("ice ice baby")
		ice.visible = true
		water.visible = false


func _on_area_entered(area: Area2D) -> void:
	#print("area detected")
	if area.is_in_group("ice"):
		print("ice ice baby")
		#iceCollision.disabled = false
		$ice/StaticBody2D/CollisionShape2D.call_deferred("set", "disabled", false)
		ice.visible = true
		water.visible = false
		
		#var collider = CollisionPolygon2D.new()
		#collider.polygon = polygon
		#add_child(collider)
