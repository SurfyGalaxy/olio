extends Button

var value = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	text = str(value)


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if not value and $"../../Selection buttons".selected_value:
				value = str($"../../Selection buttons".selected_value)
			elif str(value):
				$"../../Selection buttons".selected_value = int(value)
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			value = ""
