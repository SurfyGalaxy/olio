extends Button

var value

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if value != null:
		text = str(value)
	else:
		text = ""


func _on_pressed() -> void:
	if value == null:
		var selected = $"../../Selection buttons".selected_value
		if selected != null:
			value = selected
	else:
		value = null
