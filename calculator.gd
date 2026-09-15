extends Button

var result = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = str(result)


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if str(result) == "":
				var selection_1 = $"../../Selection buttons".values[0]
				var selection_2 = $"../../Selection buttons".values[1]
				var operator = $"../../operators".selected
				
				if ((not abs(selection_1)) or
						(not abs(selection_2) or
						(not operator))):
					print("Tried to calculate with empty value")
					return
				else:
					if operator == "+":
						result = selection_1 + selection_2
					elif operator == "-":
						result = selection_1 - selection_2
					elif operator == "*":
						result = selection_1 * selection_2
					elif operator == "<div>":
						result = int(selection_1 / selection_2)
					print(("Evaluated " + str(selection_1) + " " + operator + " " + str(selection_2) + " to " + str(result)))
					
					if not ((-128 < result) and (result < 127)):
						result = result % 256
						if result >= 128:
							result -= 256 
					
					print(("Balanced to " + str(result)))
			else:
				$"../../Selection buttons".selected_value = result
				print(("Pushed " + str(result) + " to memory"))
				result = ""
				
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			result = ""
			print("Cleared core")
