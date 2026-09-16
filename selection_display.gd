extends Label

var selection

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	selection = get_parent().selected_value
	if selection != null:
		text = "Selection: \n %d" % selection
	else:
		text = "Selection: \n None"
