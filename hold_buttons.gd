extends Button

var value


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if value != null:
		text = str(value)
	else:
		text = ""

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if value == null and $"../../Selection buttons".selected_value != null:
				value = str($"../../Selection buttons".selected_value)
			elif value != null:
				print(value)
				$"../../Selection buttons".selected_value = int(value)
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			value = null
