extends Button


var selected = StyleBoxFlat.new()
var not_selected = StyleBoxFlat.new()


func _ready() -> void:
	text = name
	not_selected.bg_color = Color(0.2, 0.2, 0.2)
	selected.bg_color = Color(0.5, 0.5, 0.5)


func _process(_delta: float) -> void:
	if $"../".selected == name:
		add_theme_stylebox_override("normal", selected)
	else:
		add_theme_stylebox_override("normal", not_selected)


func _on_pressed() -> void:
	$"../".selected = name
	print((name + " selected"))
