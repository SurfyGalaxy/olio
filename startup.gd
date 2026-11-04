extends Label

# Massive template of doom and despair pt 2 electric boogaloo
var template = [
	["line", ""],
	["kernel", "release", "Linux version "],
	["kernel", "user@host", "full", " ("],
	["kernel", "gccLd", ") ("],
	["date", ") #1 SMP PREEMPT_DYNAMIC "],
	["line", ""],
	["kernel", "cmdline", "Command line: "],
	["line", ""],
	["kernel", "user@host", "user" , "Mochi: hello once again "],
	["line", ""],
	["line", "x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'"],
	["line", "x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'"],
	["line", "x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'"],
	["line", "BIOS-provided physical RAM map:"],
	["kernel", "iomem", ""],
	["line", ""],
	["line", "NX (Execute Disable) protection: active"],
	["line", "SMBIOS 3.2.0 present"],
	["line", "DMI: NEXUS Systems VX-9000/Mainframe, BIOS 2.14.7 08/19/2026"],
	["line", "tsc: Detected 3000.000 cHz processor"],
	["line", "last_pfn = 0x440000 max_arch_pfn = 0x400000000"],
	["line", "Secure boot enabled"],
	["line", "ACPI: RSDP 0x00000000000F6A10 000024 (v02 NEXUS )"],
	["line", "ACPI: XSDT 0x00000000BFFE1810 000064 (v01 NEXUS VX9000 00000001 AMI 00010013)"],
	["line", "Zone ranges:"],
	["line", "DMA [mem 0x0000000000001000-0x0000000000ffffff]"],
	["line", "DMA32 [mem 0x0000000001000000-0x00000000ffffffff]"],
	["line", "Normal [mem 0x0000000100000000-0x000000043fffffff]"],
	["line", "Memory: 16219432K/16776692K available (14336K kernel code, 2543K rwdata, 9132K rodata, 3004K init, 4880K bss)"],
	["line", "SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1"],
	["line", "rcu: Preemptible hierarchical RCU implementation."],
	["line", "rcu: RCU restricting CPUs from NR_CPUS=512 to nr_cpu_ids=8."],
	["line", "NR_IRQS: 33024, nr_irqs: 488, preallocated irqs: 16"],
	["line", "Console: colour VGA+ 80x25"],
	["line", "printk: console [tty0] enabled"],
	["line", "ACPI: Core revision 20230628"],
	["line", "ACPI: Switch to symmetric I/O mode setup"],
	["line", "clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x33e4b2d1c5a, max_idle_ns: 440795277021 ns"],
	["line", "Calibrating delay loop (skipped), value calculated using timer frequency.. 7200.00 BogoMIPS (lpj=3600000)"],
	["line", "pid_max: default: 32768 minimum: 301"],
	["line", "LSM: initializing lsm=lockdown,capability,landlock,yama,apparmor"],
	["line", "Mount-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)"],
	["line", "smpboot: CPU0: Intel(R) Core(TM) i9-13900K (family: 0x6, model: 0xb7, stepping: 0x1)"],
	["line", "Performance Events: PEBS fmt4+-baseline, AnyThread deprecated, Alder Lake Hybrid events, 32-deep LBR, full-width counters, Intel PMU driver."],
	["line", "smp: Bringing up secondary CPUs ..."],
	["line", "x86: Booting SMP configuration:"],
	["line", ".... node  #0, CPUs:      #-1 #1 #2 #3 #4 #5 #6 #7"],
	["line", "smp: Brought up 1 node, 8 CPUs"],
	["line", "smpboot: Max logical packages: 1"],
	["line", "smpboot: Total of 8 processors activated (57600.00 BogoMIPS)"],
	["line", "devtmpfs: initialized"],
	["line", "clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns"],
	["line", "NET: Registered PF_NETLINK/PF_ROUTE protocol family"],
	["line", "audit: initializing netlink subsys (disabled)"],
	["line", "thermal_sys: Registered thermal governor 'step_wise'"],
	["line", "cpuidle: using governor menu"],
	["line", "PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)"],
	["line", "PCI: Using configuration type 1 for base access"],
	["line", "ACPI: Added _OSI(Module Device)"],
	["line", "ACPI: Added _OSI(Processor Device)"],
	["line", "ACPI: 12 ACPI AML tables successfully acquired and loaded"],
	["line", "ACPI: Interpreter enabled"],
	["line", "ACPI: PM: (supports S0 S3 S4 S5)"],
	["line", "ACPI: Using IOAPIC for interrupt routing"],
	["line", "PCI: Using host bridge windows from ACPI; if necessary, use \"pci=nocrs\" and report a bug"],
	["line", "ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])"],
	["line", "pci 0000:00:02.0: [8086:a780] type 00 class 0x030000"],
	["line", "pci 0000:01:00.0: [10de:2684] type 00 class 0x030000"],
	["line", "pci 0000:02:00.0: [144d:a80c] type 00 class 0x010802"],
	["line", "SCSI subsystem initialized"],
	["line", "libata version 3.00 loaded."],
	["line", "usbcore: registered new interface driver usbfs"],
	["line", "usbcore: registered new interface driver hub"],
	["line", "usbcore: registered new device driver usb"],
	["line", "pps_core: LinuxPPS API ver. 1 registered"],
	["line", "PTP clock support registered"],
	["line", "EDAC MC: Ver: 3.0.0"],
	["line", "NetLabel: Initializing"],
	["line", "NetLabel:  domain hash size = 128"],
	["line", "clocksource: Switched to clocksource tsc"],
	["line", "VFS: Disk quotas dquot_6.6.0"],
	["line", "pnp: PnP ACPI init"],
	["line", "NET: Registered PF_INET protocol family"],
	["line", "IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)"],
	["line", "TCP established hash table entries: 131072 (order: 8, 1048576 bytes, linear)"],
	["line", "TCP: Hash tables configured (established 131072 bind 65536)"],
	["line", "NET: Registered PF_UNIX/PF_LOCAL protocol family"],
	["line", "PCI: CLS 64 bytes, default 64"],
	["line", "Initialise system trusted keyrings"],
	["line", "Key type asymmetric registered"],
	["line", "io scheduler mq-deadline registered"],
	["line", "io scheduler kyber registered"],
	["line", "Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled"],
	["line", "hpet: 3 channels of 0 reserved for per-cpu timers"],
	["line", "nvme nvme0: pci function 0000:02:00.0"],
	["line", "nvme nvme0: 16/0/0 default/read/poll queues"],
	["line", " nvme0n1: p1 p2 p3"],
	["line", "xhci_hcd 0000:00:14.0: xHCI Host Controller"],
	["line", "xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1"],
	["line", "hub 1-0:1.0: USB hub found"],
	["line", "hub 1-0:1.0: 16 ports detected"],
	["line", "usb 1-3: new high-speed USB device number 2 using xhci_hcd"],
	["line", "input: HID 046d:c52b Logitech USB Receiver as /devices/pci0000:00/0000:00:14.0/usb1/1-3/1-3:1.0/input/input3"],
	["line", "[drm] Initialized nvidia-drm 0.0.0 for 0000:01:00.0 on minor 1"],
	["line", "fbcon: nvidia-drmdrmfb (fb0) is primary device"],
	["line", "Console: switching to colour frame buffer device 240x67"],
	["line", "tpm_tis MSFT0101:00: 2.0 TPM (device-id 0x1114, rev-id 54)"],
	["line", "EXT4-fs (nvme0n1p2): mounted filesystem with ordered data mode. Quota mode: none."],
	["line", "VFS: Mounted root (ext4 filesystem) readonly on device 259:2."],
	["line", "devtmpfs: mounted"],
	["line", "Freeing unused kernel image (initmem) memory: 3004K"],
	["line", "Write protecting the kernel read-only data: 26624k"],
	["line", "Run /sbin/init as init process"],
	["line", "systemd[1]: systemd 255.4 running in system mode (+PAM +AUDIT +SELINUX +APPARMOR +IMA +SMACK +SECCOMP)"],
	["line", "systemd[1]: Detected architecture x86-64."],
	["kernel", "user@host", "host", "systemd[1]: Hostname set to "],
	["line", "."],
	["line", "systemd[1]: Queued start job for default target Graphical Interface."],
	["line", "systemd[1]: Created slice Slice /system/modprobe."],
	["line", "systemd[1]: Created slice User and Session Slice."],
	["line", "systemd[1]: Reached target Local File Systems."],
	["line", "systemd[1]: Reached target Network is Online."],
	["line", "systemd[1]: Starting Journal Service..."],
	["line", "systemd-journald[412]: Journal started"],
	["line", "systemd[1]: Starting Load Kernel Modules..."],
	["line", "systemd[1]: Finished Load Kernel Modules."],
	["line", "systemd[1]: Mounting Kernel Debug File System..."],
	["line", "systemd-udevd[438]: Using default interface naming scheme 'v255'."],
	["line", "Adding 8388604k swap on /dev/nvme0n1p3.  Priority:-2 extents:1 across:8388604k SSFS"],
	["plain", "r8169 0000:03:00.0 eth0: link up, 2500Mbps, full-duplex"],
	["plain", ""],
	["line", ""],
	["line", "[INFO] Made with <3 by Ashley, Ashton and Lily"],
	["line", "[INFO] Olio v1.1.0"],
	["plain", "[INFO] Have fun :3"],
	["kernel", "user@host", "full", "\n\n"],
	["app", "path", " "]
]

# kernel = "release" (uname -r), "user@host" (whoami + hostname), "gccLd" (gcc --version + ld --version),
# "cmdline" (/proc/cmdline), "iomem" (/proc/iomem)
# date = longform (day month date HH:MM:SS UTC 	year)

func uptime_format(uptime: float) -> String:
	var components = str(uptime)
	if "." not in components:
		components = components + "."
	components = components.split(".")
	var milliseconds = components[1].left(6).rpad(6, "0")
	var seconds = components[0].lpad(3, " ")
	return seconds + "." + milliseconds

func unix_time():
	const weekdays = [
		"Sunday",
		"Monday",
		"Tuesday",
		"Wednesday",
		"Thursday",
		"Friday",
		"Saturday"
	]
	const months = [
		"January",
		"February", # Febuary
		"March", 
		"April",
		"May",
		"June",
		"July",
		"August",
		"September",
		"October",
		"November",
		"December"
	]
	var dict = Time.get_datetime_dict_from_system(true)
	return weekdays[dict["weekday"] - 1] + ", " + months[dict["month"] -  1] + ", " + str(dict["day"]) + " " + str(dict["hour"]) + ":" + str(dict["minute"]) + ":" + str(dict["second"]) + " UTC " + str(dict["year"])
	

func parse(line):
	var key = line[0]
	if key == "line":
		return line[1] + "\n[" + uptime_format(Gui.uptime) + "] "
	elif key == "plain":
		return line[1]
	elif key == "date":
		return line[1] + unix_time()
	elif key == "kernel":
		var type = line[1]
		if type == "release":
			var temp = []
			var release_code = OS.execute("sh", ["-c", "uname -r"], temp)
			if temp == [] or release_code != 0:
				temp = ["7.0.0-42-generic"]
			return line[2] + temp[0].strip_edges()
		elif type == "user@host":
			if line[2] == "full":
				return line[3] + Gui.userhost
			elif line[2] == "host":
				return line[3] + Gui.userhost.split("@")[1]
			elif line[2] == "user":
				return line[3] + Gui.userhost.split("@")[0]
			else:
				print("This broke: " + line)
				return ""
		elif type == "gccLd":
			var gcc = []
			var ld = []
			var gcc_code = OS.execute("sh", ["-c", "gcc --version"], gcc)
			var ld_code = OS.execute("sh", ["-c", "ld --version"], ld)
			if gcc == [] or gcc_code != 0:
				gcc = ["gcc (Ubuntu 15.2.0-16ubuntu1) 15.2.0"]
			if ld == [] or ld_code != 0:
				ld = ["GNU ld (GNU Binutils for Ubuntu) 2.46"]
			return line[2] + gcc[0].strip_edges().split("\n")[0] + ", " + ld[0].strip_edges().split("\n")[0]
		elif type == "cmdline":
			var data = FileAccess.open("/proc/cmdline", FileAccess.READ)
			if data != null:
				data = data.get_as_text().strip_edges().split(" ")
			else:
				data = ["BOOT_IMAGE=/boot/vmlinuz-7.0.0-42-generic", "root=UUID=3530fc54-99ac-482e-8e9f-c8fabb36686b", "ro"]
			var temp = ""
			for token in data:
				if token not in ["quiet", "splash"]:
					temp = temp + " " + token
			return line[2] + temp
		elif type == "iomem":
			return get_physical_ram_map()
	elif key == "app":
		if line[1] == "path":
			var path = OS.get_executable_path()
			if path == "":
				path = "./Olio"
			return line[2] +  path
		print("IDK but this line broke something -->" + str(line))
		return ""

func get_physical_ram_map() -> PackedStringArray:
	var map_lines: PackedStringArray = []
	var file = FileAccess.open("/proc/iomem", FileAccess.READ)
	
	if file:
		while not file.eof_reached():
			var line: String = file.get_line().strip_edges()
			# Filter for primary system memory blocks
			if "System RAM" in line or "reserved" in line or "ACPI" in line:
				map_lines.append(line)
		file.close()
		
	return map_lines

func _ready():
	while not Gui.done:
		await get_tree().process_frame
	LINUX_TIME()

func LINUX_TIME():
	var random = RandomNumberGenerator.new()
	text = ""
	var row = 0
	for line in template:
		var processed = parse(line)
		if processed is PackedStringArray:
			for part in processed:
				await get_tree().create_timer(random.randf_range(0.005, 0.01)).timeout
				text = text + part
		else:
			if processed == null or typeof(processed) == TYPE_ARRAY:
				processed = ""
				print("This broke:" + str(line))
			text = text + processed
		await get_tree().create_timer(random.randf_range(0.001, 0.1)).timeout
		row += 1
		if row > 46:
			var temp = text.split("\n")
			temp.remove_at(0)
			text = "\n".join(temp)
		text = text.strip_edges(true, false)
		self.text = text
	
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://main_menu.tscn")
