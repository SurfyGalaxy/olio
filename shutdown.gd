extends Label

const template = [
	["line", ""],
	["line", "systemd-shutdown[1]: Sending SIGTERM to remaining processes..."],
	["line", "Mochi: going so soon?"],
	["line", "systemd-shutdown[1]: Sending SIGKILL to remaining processes..."],
	["line", "systemd-shutdown[1]: Unmounting file systems."],
	["line", "[4127]: Remounting '/home' read-only in with options 'errors=remount-ro'."],
	["line", "EXT4-fs (nvme0n1p3): re-mounted. Quota mode: none."],
	["line", "[4128]: Unmounting '/home'."],
	["line", "[4129]: Remounting '/' read-only in with options 'errors=remount-ro'."],
	["line", "EXT4-fs (nvme0n1p2): re-mounted. Quota mode: none."],
	["line", "systemd-shutdown[1]: All filesystems unmounted."],
	["line", "systemd-shutdown[1]: Deactivating swaps."],
	["line", "systemd-shutdown[1]: All swaps deactivated."],
	["line", "systemd-shutdown[1]: Detaching loop devices."],
	["line", "systemd-shutdown[1]: All loop devices detached."],
	["line", "systemd-shutdown[1]: Stopping MD devices."],
	["line", "systemd-shutdown[1]: All MD devices stopped."],
	["line", "systemd-shutdown[1]: Detaching DM devices."],
	["line", "systemd-shutdown[1]: All DM devices detached."],
	["line", "systemd-shutdown[1]: All filesystems, swaps, loop devices, MD devices and DM devices detached."],
	["line", "systemd-shutdown[1]: Syncing filesystems and block devices."],
	["line", "systemd-shutdown[1]: Powering off."],
	["line", "kvm: exiting hardware virtualization"],
	["line", "xhci_hcd 0000:00:14.0: xHCI host controller not responding, assume dead"],
	["line", "ACPI: PM: Preparing to enter system sleep state S5"],
	["plain", "reboot: Power down"]
]

var random = RandomNumberGenerator.new()

func uptime_format(uptime: float) -> String:
	var components = str(uptime)
	if "." not in components:
		components = components + "."
	components = components.split(".")
	var milliseconds = components[1].left(6).rpad(6, "0")
	var seconds = components[0].lpad(3, " ")
	return seconds + "." + milliseconds

func parse(line):
	var key = line[0]
	if key == "line":
		return line[1] + "\n[" + uptime_format(Gui.uptime) + "] "
	elif key == "plain":
		return line[1]
	else:
		print("This line broke it: " + str(line))
		return ""

func _ready() -> void:
	for line in template:
		text = text + parse(line)
		text = text.strip_edges(true, false)
		await get_tree().create_timer(random.randf_range(0.001, 0.01)).timeout
	await get_tree().create_timer(0.1).timeout
	get_tree().quit()
		
		
		
		
