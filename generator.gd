extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = str(randi_range(-228, 127))
	while text == "0":
		text = str(randi_range(-228, 127))

func _on_pressed() -> void:
	print("New Selection: " + name)
	get_parent().selected_value = text
