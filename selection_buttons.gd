extends Node

var target
var values = []
var selected_value

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	values =generate(3)

func _process(_delta: float) -> void:
	if target != null:
		selected_value = values[int(target) - 1]
		target = null
		print(selected_value)

func generate(count: int) -> Array:
	var result = []
	while count > 0:
		result.append(RandomNumberGenerator.new().randi_range(-128, 127))
		count -= 1
	return result
