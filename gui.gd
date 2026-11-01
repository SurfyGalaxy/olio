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
var userhost = "player@OlIo"
var done = false

signal Overheated


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var user = []
	var host = []
	OS.execute("whoami", [], user)
	OS.execute("hostname", [], host)
	userhost = user[0].strip_edges() + "@" + host[0].strip_edges()
	done = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
var timer = 0
var uptime = 0
var playing = false
func _process(delta: float) -> void:
	uptime += delta
	if (temperature >= TjMax) and (temperature <= trip):
		speed = prochot
	elif temperature > trip:
		speed = 0
		Overheated.emit()
	else:
		speed = clock_time
	if playing:
		timer += delta


func _on_a_6_game_over() -> void: # dumb autogen name but it works
	playing = false
	get_tree().change_scene_to_file("res://game_over.tscn")
