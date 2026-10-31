extends Label

var preset = text
func _on_timer_timeout() -> void:
	if text == "":
		text = preset
	else:
		text = ""
