extends Button

var timer = 0

signal correct_answer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timer > 0:
		timer -= delta * $"../../".speed
	elif text != "Submit":
		text = "Submit"
		disabled = false


func _on_pressed() -> void:
	var selected = $"../../Selection buttons".selected_value
	if int(selected) == int($"../../Selection buttons/A1".text):
		text = "Correct"
		disabled = true
		timer = 2
		$"../../gui".score += 1
		correct_answer.emit()
		
	else:
		text = "Incorrect"
		disabled = true
		timer = 3
