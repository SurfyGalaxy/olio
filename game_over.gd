extends Node2D

var template = [
	["line", "Mochi: :("],
	["line", "Kernel panic - not syncing: Out of memory and panic_on_oom is set"],
	["random", 0, 6, "CPU: "],
	["process", "PID", " PID: "],
	["process", "name", " Comm: "],
	["kernel", "version", " Tainted: G        W        "],
	["line", ""],
	["hardware", "name", "Hardware name: "],
	["line", " / Thread-0"],
	["line", "Call Trace:"],
	["line", "<TASK>"],
	["offset", 96, "dump_stack_lvl"],
	["line", ""],
	["offset", 784, "panic"],
	["line", ""],
	["offset", 1152, "out_of_memory"],
	["line", ""],
	["offset", 3104, "__alloc_pages_slowpath"],
	["line", ""],
	["offset", 672, "__alloc_pages"],
	["line", ""],
	["offset", 272, "task_struct_whitelist_alloc"],
	["line", ""],
	["offset", 6848, "copy_process"],
	["line", ""],
	["offset", 976, "kernel_clone"],
	["line", ""],
	["offset", 128, "__do_sys_clone"],
	["line", ""],
	["offset", 288, "do_syscall_64"],
	["line", ""],
	["offset", 126, "entry_SYSCALL_64_after_hwframe"],
	["line", ""],
	["line", "</TASK>"],
	["line", "Tasks state (memory values in pages):"],
	["line", "  [  pid  ]   uid  tgid total_vm      rss pgtables_bytes oom_score_adj name"],
	["line", "  [      1]     0     1    42113     3012         163840             0 systemd"],
	["line", "  [    812]     0   812    15620     2204          98304         -1000 sshd"],
	["line", "  [   2210]   113  2210   389204    61230         786432             0 postgres"],
	["line", "  [   3345]  1000  3345  1284562   842117        6291456           200 node"],
	["line", "  [   4102]  1000  4102  2097152  1523004        9437184             0 java"],
	["line", "  [   4890]  1000  4890     5871     1190          73728             0 bash"],
	["line", "  ... 999+ more processes truncated due to memory exhaustion ..."],
	["end", "---[ end Kernel panic - not syncing: Out of memory and panic_on_oom is set ]---"],
]
var random = RandomNumberGenerator.new()
var text = ""
var temp
var process = []
var kernel = []
var hardware = []

func uptime_format(uptime: float) -> String:
	var components = str(uptime)
	if "." not in components:
		components = components + "."
	components = components.split(".")
	var milliseconds = components[1].left(6).rpad(6, "0")
	var seconds = components[0].lpad(3, " ")
	return seconds + "." + milliseconds



func parse(line):
	if line[0] == "line":
		return line[1] + "\n[" + uptime_format(Gui.uptime) + "] "
	elif line[0] == "random":
		return line[3] + str(random.randi_range(line[1], line[2]))
	elif line[0] == "process":
		if line[1] == "PID":
			temp = process[1]
		else: # Name
			temp = process[0]
		return line[2] + temp
	elif line[0] == "kernel":
		if line[1] == "version":
			return line[2] + kernel
	elif line[0] == "hardware":
		if line[1] == "name":
			return line[2] + hardware
	elif line[0] == "offset":
		var pos = random.randi_range(0, line[1])
		pos = "0x%x" % pos
		var full = "0x%x" % line[1]
		return line[2] + "+" + pos + "/" + full
	elif line[0] == "end":
		return line[1]

func time_format(second: float) -> String:
	var minutes: int = int(second / 60)
	var seconds: int = int(second) % 60

	return "%01d minutes and %01d seconds" % [minutes, seconds]


func _ready() -> void:
	OS.execute("sh", ["-c", "ps -e -o comm=,pid= | shuf | head -n 1"], process)
	process = process[0].strip_edges().split(" ")
	temp = []
	for processes in process:
		if processes != "":
			temp.append(processes)
	process = temp
	temp = ""
	for index in range(process.size()):
		var thing = process[index]
		if index < (process.size() - 1):
			temp = temp + thing
		else:
			process = [temp, thing]
	print(process)
	OS.execute("sh", ["-c", "uname -r"], kernel)
	kernel = kernel[0].strip_edges()
	OS.execute("sh", ["-c", "lscpu | grep 'Model name'"], hardware)
	hardware = hardware[0].substr(12).strip_edges()
	
	if process == []:
		process = ["Systemd", "1"]

	for line in template:
		var data = parse(line)
		await get_tree().create_timer(random.randf_range(0.005, 0.01)).timeout
		$"RichTextLabel".text = ($"RichTextLabel".text + data).strip_edges(true, false)
	
	await get_tree().create_timer(random.randf_range(0.005, 0.01)).timeout
	$"RichTextLabel".text = ($"RichTextLabel".text + 
	"\n\n[" + uptime_format(Gui.uptime) + "] [INFO] You lasted " + time_format(Gui.timer) + ", and solved " + str(Gui.score) + " problems." + "\n" + 
	"\n\n[" + uptime_format(Gui.uptime) + "] [INFO] Press [R] to Reboot System.")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("main menu"):
		get_tree().change_scene_to_file("res://main_menu.tscn")
