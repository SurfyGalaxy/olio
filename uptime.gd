extends Label

var selection = 0
var active = 0

func time_format(second: float) -> String:
	var minutes: int = int(second / 60)
	var seconds: int = int(second) % 60

	return "%02d:%02d" % [minutes, seconds]

func selected(option):
	if option == 0: # Play game
		get_tree().change_scene_to_file("res://main.tscn")
	elif option == 1: # Options
		pass
	elif option == 2: # Quit
		get_tree().change_scene_to_file("res://quit.tscn")
func _process(_delta: float) -> void:
	const text_header = " _______  ___      ___   _______ 
|       ||   |    |   | |       |
|   _   ||   |    |   | |   _   |
|  | |  ||   |    |   | |  | |  |
|  |_|  ||   |___ |   | |  |_|  |
|       ||       ||   | |       |
|_______||_______||___| |_______|

v1.1.0



"
	const selection_options = [
"> START GAME <
OPTIONS
QUIT",
"START GAME
> OPTIONS <
QUIT",
"START GAME
OPTIONS
> QUIT <"]
	if Input.is_action_just_pressed("up"):
		selection -= 1
	if Input.is_action_just_pressed("down"):
		selection += 1
	if Input.is_action_just_pressed("select"):
		selected(active)
	active = posmod(selection, 3)

	text = text_header + selection_options[active]
