extends Node

var equation
var difficulty
var speed = 10 # Clock speed in hz

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Gui.playing = true
	Gui.timer = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
#	equation = $equation.equation
	


func _on__pressed() -> void:
	pass # Replace with function body.


func _on_answer_correct_answer() -> void:
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	pass # Replace with function body.
