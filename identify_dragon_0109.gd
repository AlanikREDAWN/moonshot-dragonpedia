extends Control


func _ready() -> void:
	print_debug("starting")
	visible = false
	#$background.visible = false
	
	$sky.visible = false
	$far_mountains.visible = false
	$middle_mountains.visible = false
	$far_trees.visible = false
	$myst.visible = false
	$near_trees.visible = false
	
	$dragon_sprite0109.visible = false
	$dragon_sprite0113.visible = false
	$dragon_sprite0015.visible = false
	$dragon_sprite0032.visible = false
	$dragon_sprite0115.visible = false
	$dragon_sprite0114.visible = false
	$dragon_sprite0104.visible = false
	EventHandler.identify_started.connect(init)
	#EventHandler.identify0109_started.connect(button)
	#$Panel/identify_button.pressed.connect(_on_identify_button_pressed)
	EventHandler.identify_started.connect(_on_identify_button_pressed)
	
	print_debug("starting done")
	#pass

#func _process(delta: float, character_name, dragonNumber) -> void:
	#$Panel/identify_button.pressed.connect(_on_identify_button_pressed.bind(dragonNumber))
	#$Panel/identify_button.pressed.connect(_on_button_down.bind("Test"))
	#buttonBind()

func buttonBind(character_name, dragonNumber):
	$Panel/identify_button.pressed.connect(_on_identify_button_pressed.bind(dragonNumber))

func init(character_name, dragonNumber):
	#$Panel/identify_button.pressed.connect(_on_identify_button_pressed.bind(dragonNumber))
	if dragonNumber == 0109:
		$dragon_sprite0109.visible = true
		
		$dragon_sprite0113.visible = false
		$dragon_sprite0015.visible = false
		$dragon_sprite0032.visible = false
		$dragon_sprite0115.visible = false
		$dragon_sprite0114.visible = false
		$dragon_sprite0104.visible = false
		EventHandler.currentDragon = 0109
	if dragonNumber == 0113:
		$dragon_sprite0113.visible = true
		
		$dragon_sprite0109.visible = false
		$dragon_sprite0015.visible = false
		$dragon_sprite0032.visible = false
		$dragon_sprite0115.visible = false
		$dragon_sprite0114.visible = false
		$dragon_sprite0104.visible = false
		EventHandler.currentDragon = 0113
	if dragonNumber == 0015:
		$dragon_sprite0015.visible = true
		
		$dragon_sprite0113.visible = false
		$dragon_sprite0109.visible = false
		$dragon_sprite0032.visible = false
		$dragon_sprite0115.visible = false
		$dragon_sprite0114.visible = false
		$dragon_sprite0104.visible = false
		EventHandler.currentDragon = 0015
	if dragonNumber == 0032:
		print_debug("dragon is 0032")
		$dragon_sprite0032.visible = true
		
		$dragon_sprite0015.visible = false
		$dragon_sprite0113.visible = false
		$dragon_sprite0109.visible = false
		$dragon_sprite0115.visible = false
		$dragon_sprite0114.visible = false
		$dragon_sprite0104.visible = false
		EventHandler.currentDragon = 0032
	if dragonNumber == 0115:
		$dragon_sprite0115.visible = true
		
		$dragon_sprite0109.visible = false
		$dragon_sprite0113.visible = false
		$dragon_sprite0015.visible = false
		$dragon_sprite0032.visible = false
		$dragon_sprite0114.visible = false
		$dragon_sprite0104.visible = false
		EventHandler.currentDragon = 0115
	if dragonNumber == 0114:
		$dragon_sprite0114.visible = true
		
		$dragon_sprite0109.visible = false
		$dragon_sprite0113.visible = false
		$dragon_sprite0015.visible = false
		$dragon_sprite0032.visible = false
		$dragon_sprite0115.visible = false
		$dragon_sprite0104.visible = false
		EventHandler.currentDragon = 0114
	if dragonNumber == 0104:
		$dragon_sprite0104.visible = true
		
		$dragon_sprite0109.visible = false
		$dragon_sprite0113.visible = false
		$dragon_sprite0015.visible = false
		$dragon_sprite0032.visible = false
		$dragon_sprite0115.visible = false
		$dragon_sprite0114.visible = false
		EventHandler.currentDragon = 0104
		
	print_debug("init")
	visible = true
	$AnimationPlayer.play("fade_in")
	get_tree().paused = true
	$Panel/Label.text = "a wild %s appears" %[character_name]
	print_debug("init done")
	#pass


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade_in":
		print_debug("making things visible")
		$AnimationPlayer.play("fade_out")
		#$background.visible = true
		
		$sky.visible = true
		$far_mountains.visible = true
		$middle_mountains.visible = true
		$far_trees.visible = true
		$myst.visible = true
		$near_trees.visible = true
		$Panel/identify_button.grab_focus()
		print_debug("done making things visible")
	#pass


func _on_leave_button_pressed() -> void:
	print_debug("leave button pressed")
	print("working")
	get_tree().paused = false
	visible = false
	#$background.visible = false
	
	$sky.visible = false
	$far_mountains.visible = false
	$middle_mountains.visible = false
	$far_trees.visible = false
	$myst.visible = false
	$near_trees.visible = false
	
@onready var level1 = preload("res://level1.tscn").instantiate()
@onready var level2 = preload("res://level2.tscn").instantiate()

func _on_identify_button_pressed() -> void:
	print_debug("identify button pressed")
	print("working")
	get_tree().paused = false
	visible = false
	#$background.visible = false
	
	$sky.visible = false
	$far_mountains.visible = false
	$middle_mountains.visible = false
	$far_trees.visible = false
	$myst.visible = false
	$near_trees.visible = false
	#$Panel/identify_button.pressed.connect(_on_identify_button_pressed)
	if EventHandler.currentDragon == 0109:
		$"../../../../dragon0109".queue_free()
		EventHandler.currentDragon = null
		EventHandler.dragon0109 = true
		get_tree().change_scene_to_file("res://level1.tscn")
		#get_parent().add_child(level1)
		#get_parent().remove_child(self)
		#self.get_parent().add_child(level1)
		#get_parent().remove_child(self)

	if EventHandler.currentDragon == 0113:
		print_debug("making new dragon go away")
		$"../../../../dragon0113".queue_free()
		EventHandler.currentDragon = null
		EventHandler.dragon0113 = true
		print_debug("new dragon gone")
		get_tree().change_scene_to_file("res://level2.tscn")
		#get_parent().add_child(level1)
		#get_parent().remove_child(self)
	if EventHandler.currentDragon == 0015:
		print_debug("making new dragon go away")
		$"../../../../dragon0015".queue_free()
		EventHandler.currentDragon = null
		EventHandler.dragon0015 = true
		print_debug("new dragon gone")
	if EventHandler.currentDragon == 0032:
		print_debug("making new dragon go away")
		$"../../../../dragon0032".queue_free()
		EventHandler.currentDragon = null
		EventHandler.dragon0032 = true
		print_debug("new dragon gone")
	if EventHandler.currentDragon == 0115:
		$"../../../../dragon0115".queue_free()
		EventHandler.currentDragon = null
		EventHandler.dragon0115 = true
		get_tree().change_scene_to_file("res://level4.tscn")
	if EventHandler.currentDragon == 0114:
		$"../../../../dragon0114".queue_free()
		EventHandler.currentDragon = null
		EventHandler.dragon0114 = true
		get_tree().change_scene_to_file("res://level3.tscn")
	if EventHandler.currentDragon == 0104:
		$"../../../../dragon0104".queue_free()
		EventHandler.currentDragon = null
		EventHandler.dragon0104 = true
	
	
	
	
	EventHandler.dragonsIdentified += 1
	#pass
