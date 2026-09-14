extends Button


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if len(get_parent().values) >= int(name):
		disabled = false
		text = str(get_parent().values[int(name) - 1])
	else:
		disabled = true
		text = ""


func _on_pressed() -> void:
	get_parent().target = name
