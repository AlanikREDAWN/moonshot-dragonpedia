extends Button
#
##
##func _show():
	##.show() #important when overriding
	##set_process_input(true)
##
	### grab focus of the first node
	##$".".grab_focus()
##
##func _hide():
	##.hide() #important when overriding
	##set_process_input(false) #disable input for this node
#
#func _process(delta: float) -> void:
	#$".".on_accept
#
#func _input(event):
	#if Input.is_action_pressed("click"):
		#call_deferred("click")
#
#func click():
	#var a = InputEventMouseButton.new()
	#a.position = get_global_mouse_position()
	#a.button_index = MOUSE_BUTTON_LEFT
	#a.pressed = true
	#Input.parse_input_event(a)
	#await get_tree().process_frame
	#a.pressed = false
	#Input.parse_input_event(a)
