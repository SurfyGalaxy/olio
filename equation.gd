extends Node2D

var operators = ["+", "-", "*", "<div>"]
var equation
var answer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var data = generate(2)
	equation = data["result"]
	answer = data["answer"]


func generate(count: int) -> Dictionary:
	var result = []
	var operator = operators.pick_random()
	while count > 0:
		result.append(RandomNumberGenerator.new().randi_range(-128, 127))
		count -= 1
		if count > 0:
			result.append(operator)
	
	if operator == "+":
		answer = result[0] + result[2]
	elif operator == "-":
		answer = result[0] - result[2]
	elif operator == "*":
		answer = result[0] * result[2]
	else:
		answer = result[0] / result[2]
	
	if not ((-128 < answer) and (answer < 127)):
		answer = answer % 256
		if answer >= 128:
			answer -= 256
	 
	return {
		"result": result,
		"answer": answer}
