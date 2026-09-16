extends Node2D

var operators = ["+", "-", "*", "<div>"]
var equation

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	equation = generate(2)


func generate(count: int) -> Array:
	var result = []
	while count > 0:
		result.append(RandomNumberGenerator.new().randi_range(-128, 127))
		count -= 1
		if count > 0:
			result.append(operators.pick_random())
	return result
