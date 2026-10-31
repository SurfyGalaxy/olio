extends Node2D

var score = 0
var clock_time = 30
var temperature = RandomNumberGenerator.new().randi_range(30, 50)
var per_cycle_temp_change = 0.1
var TjMax = 100
var trip = 115
var prochot = 8
var speed = 30
var delay = 1 # seconds between problems spawning

signal Overheated

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
var timer = 0
var uptime = 0
func _process(delta: float) -> void:
	uptime += delta
	if (temperature >= TjMax) and (temperature <= trip):
		speed = prochot
	elif temperature > trip:
		speed = 0
		Overheated.emit()
	else:
		speed = clock_time
	timer += delta


func _on_a_6_game_over() -> void: # dumb autogen name but it works
	get_tree().change_scene_to_file("res://game_over.tscn")
