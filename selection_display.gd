extends Label

var selection

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	selection = get_parent().selected_value
	if selection:
		text = "Selection: \n %d" % selection
	else:
		text = "Selection: \n None"
