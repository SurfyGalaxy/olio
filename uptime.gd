extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func time_format(second: float) -> String:
	var minutes: int = int(second / 60)
	var seconds: int = int(second) % 60

	return "%02d:%02d" % [minutes, seconds]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	text = "Uptime: " + time_format(Gui.uptime)
