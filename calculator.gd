extends Button

var result = ""
var operator
var new_value
var holder
var timer = 0
const TIMINGS = { # Time in seconds
	"+": 2,
	"-": 2,
	"*": 1,
	"<div>": 1
}


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if new_value != null:
		holder = new_value
		new_value = null
		timer = TIMINGS[operator]
		print("Starting new timer for " + str(timer) + " seconds")
		disabled = true
	if timer > 0:
		timer -= delta
		print("Time left: " + str(timer) + "s")
	if timer <= 0 and holder != null:
		result = holder
		holder = null
		disabled = false
		print("New result: " + str(result))
	text = str(result)


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if str(result) == "":
				var selection_1 = $"../../Selection buttons".values[0]
				var selection_2 = $"../../Selection buttons".values[1]
				operator = $"../../operators".selected
				
				if ((not abs(selection_1)) or
						(not abs(selection_2) or
						(not operator))):
					print("Tried to calculate with empty value")
					return
				else:
					if operator == "+":
						new_value = selection_1 + selection_2
					elif operator == "-":
						new_value = selection_1 - selection_2
					elif operator == "*":
						new_value = selection_1 * selection_2
					elif operator == "<div>":
						new_value = int(selection_1 / selection_2)
					print(("Evaluated " + str(selection_1) + " " + operator + " " + str(selection_2) + " to " + str(new_value)))
					
					if not ((-128 < new_value) and (new_value < 127)):
						new_value = new_value % 256
						if new_value >= 128:
							new_value -= 256 
					
					print(("Balanced to " + str(new_value)))
			else:
				$"../../Selection buttons".selected_value = result
				print(("Pushed " + str(result) + " to memory"))
				result = ""
				
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			result = ""
			print("Cleared core")
