extends Button
signal game_over
func generate():
	if name == "A6" or int(name) >= 11:
		text = str(randi_range(-228, 127))
		while text == "0":
			text = str(randi_range(-228, 127))

func _ready() -> void:
	if ((name != "A1") and (int(name) > 2)) or name == "A2": # Idk why but A2 is excluded?
		disabled = true
	_on_answer_correct_answer()

var timer = 0
func _process(delta: float) -> void:
	print($"../Timer".wait_time)
	if text == "" and (name != "A6" or int(name) >= 11):
		
		if str(name)[0] != "A":
			var next_above = (int(name) + 2)
			if int(name) <= 10:
				text = get_node("../" + str(next_above)).text
				get_node("../" + str(next_above)).text = ""
		else:
			var next_above = "A" + str(int(str(name)[1]) + 1)
			if name != "A6":
				text = get_node("../" + str(next_above)).text
				get_node("../" + str(next_above)).text = ""
	timer += delta

func _on_pressed() -> void:
	print("New Selection: " + name)
	get_parent().selected_value = text

func _on_answer_correct_answer() -> void:
	generate()
	if name == "A1" or int(name) <= 2:
		text = ""

func _on_timer_timeout() -> void:
	if text != "":
		print("Game Over")
		game_over.emit()
		return
	generate()
