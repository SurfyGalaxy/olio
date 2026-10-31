extends Node2D

var template = [
	["line", ""],
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
	["line", "[  pid  ]   uid  tgid total_vm      rss pgtables_bytes oom_score_adj name"],
	["task block"],
	["line", "... 999+ more processes truncated due to memory exhaustion ..."],
	["line", "---[ end Kernel panic - not syncing: Out of memory and panic_on_oom is set ]---"],
	["line", ""],
	["end", "CRITICAL: CPU execution halted. Press [R] to Reboot System."]
]
func uptime_format(uptime: float) -> String:
	var components = str(uptime)
	if "." not in components:
		components = components + "."
	components = components.split(".")
	var milliseconds = components[1].left(6).rpad(6, "0")
	var seconds = components[0].lpad(3, " ")
	return seconds + milliseconds
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var random = RandomNumberGenerator.new()
	var text = ""
	var temp
	var process = []
	var kernel = []
	OS.execute("sh", ["-c", "ps -e -o comm,pid | shuf | head -n 1"], process)
	process = process[0].stripedges().split()
	OS.execute("sh", ["-c", "uname -r"], kernel)
	kernel = kernel[0].stripedges()
	for line in template:
		if line[0] == "line":
			text = text + line[1] + "\n[" + uptime_format(Gui.uptime) + "] "
		elif line[0] == "random":
			text = text + line[3] + random.randi_range(line[1], line[2])
		elif line[0] == "process":
			if line[1] == "PID":
				temp = process[1]
			else: # Name
				temp = process[0]
			text = text + line[2] + temp
		elif line[0] == "kernel":
			if line[1] == "version":
				text = text + line[2] + kernel

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
