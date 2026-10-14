extends Button


func _process(delta: float) -> void:
	text = str(RandomNumberGenerator.new().randi_range(-128, 127))


func _on_pressed() -> void:
	print("New Selection: " + name)
	get_parent().target = name
