extends Button

var clock = 0

signal correct_answer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if clock > 0:
		clock -= delta * $"../../".speed
	elif text != "Submit":
		text = "Submit"
		disabled = false


func _on_pressed() -> void:
	var selected = $"../../Selection buttons".selected_value
	if int(selected) == int($"../../Selection buttons/A1".text):
		text = "Correct"
		disabled = true
		clock = 2
		gooooo()
		$"../../gui".score += 1
		correct_answer.emit()
		
	else:
		text = "Incorrect"
		disabled = true
		clock = 3
		
func gooooo():
	var timer = $"../../Selection buttons/Timer"
	var new_wait = max(1, timer.wait_time - 1)
	if new_wait < 20:
		return
	if timer.is_stopped():
		timer.wait_time = new_wait
	else:
		var left = max(1, timer.time_left - 1)
		timer.start(left)      
		timer.wait_time = new_wait 
