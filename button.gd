extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


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
