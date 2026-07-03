--------------------
-- DARK THEME ### --
--------------------
hl.env("GTK_THEME", "adw-gtk3")               -- for GTK3 apps
hl.env("GTK_COLOR_SCHEME", "prefer-dark")     -- for GTK4 apps
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")       -- for Qt apps

hl.env("STEAM_FORCE_DESKTOPUI_SCALING", 1.25) -- HiDPI for Steam

--------------
-- MONITORS --
--------------
hl.monitor({
	output = "",
	mode = "preferred",
	position = "0x0",
	scale = "1.25"
})

-- Second monitor used at work
hl.monitor({
	output = "HDMI-A-1",
	mode = "2560x1440@60",
	-- 1920 / 1.25 = 1536 -> put this monitor on the right of the integrated one
	-- Adjust height as needed
	position = "1536x-1110",
	scale = "1"
})


-----------------
-- MY PROGRAMS --
-----------------

local terminal = "kitty"
local guiFileManager = "thunar"
local tuiFileManager = "yazi"
local menu = "hyprlauncher"
local mainMod = "SUPER"


---------------
-- AUTOSTART --
---------------

hl.on("hyprland.start", function()
	hl.exec_cmd("ashell")
	hl.exec_cmd("hyprpolkitagent")
	hl.exec_cmd("hyprsunset")
	hl.exec_cmd("hyprlauncher -d")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("wl-paste --watch cliphist store")
	-- hl.exec_cmd(("awww-daemon"))
	hl.exec_cmd(("pano-scrobbler --minimized"))
end)



---------------------------
-- ENVIRONMENT VARIABLES --
---------------------------

-- Fix xwayland apps
hl.env("GDK_SCALE", "1.25")
hl.env("XCURSOR_SIZE", "24")

hl.config({
	xwayland = {
		force_zero_scaling = true
	}
})

hl.env("HYPRCURSOR_SIZE", "24")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("EDITOR", "/usr/bin/nvim")


-------------------
-- LOOK AND FEEL --
-------------------
hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 20,
		border_size = 2,
		col = {
			-- active_border = "rgba(33ccffee) rgba(00ff99ee) 45deg",
			active_border = {
				colors = { "rgba(33ccffee)", "rgba(00ff99ee)" },
				angle = 45,
				inactive_border = "rgba(595959aa)"
			}
		},
		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle"
	},
	decoration = {
		rounding = 10,
		rounding_power = 2,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)"
		},
		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696
		}
	},
	master = {
		new_status = "master"
	},
	misc = {
		force_default_wallpaper = -1,
		disable_hyprland_logo = false,
		-- Focus on window when it receives a request of focus (e.g. on notification click)
		focus_on_activate = true
	}
})

-- ANIMATIONS --
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

-----------
-- INPUT --
-----------
hl.config({
	input = {
		kb_layout = "us_intl",
		kb_variant = "",
		kb_model = "",
		kb_options = "caps:swapescape,compose:ins",
		kb_rules = "",
		follow_mouse = 1,
		sensitivity = 0,
		touchpad = {
			natural_scroll = true
		}
	}
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace"
})

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5
})

-----------------
-- KEYBINDINGS --
-----------------
-- Terminal & Apps
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("kitty " .. tuiFileManager))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(guiFileManager))
hl.bind(mainMod .. " + F", hl.dsp.window.float())
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

-- Screenshot
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy"))
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen())

-- Clipboard history
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | hyprlauncher --dmenu | cliphist decode | wl-copy"))
hl.bind(mainMod .. "+ SHIFT + V", hl.dsp.exec_cmd("cliphist wipe"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }))

-- Switch workspaces with mainMod + [0-9]
for i = 1, 9 do
	hl.bind(mainMod .. " + " .. tostring(i), hl.dsp.focus({ workspace = i }))
end
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 9 do
	hl.bind(mainMod .. " + SHIFT + " .. tostring(i), hl.dsp.window.move({
		workspace = i
	}))
end
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({
	workspace = 10
}))

-- Scroll through active (non-empty) workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))


-- Scroll through workspaces (including empty ones) with mainMod + scroll
hl.bind(mainMod .. " + SHIFT + mouse_down", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + SHIFT + mouse_up", hl.dsp.focus({ workspace = "-1" }))


-- Scroll through workspaces (including empty ones) with mainMod + [ ]
hl.bind(mainMod .. " + bracketright", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + bracketleft", hl.dsp.focus({ workspace = "-1" }))


-- Move window to next/previous workspace with mainMod + SHIFT + [ ]
hl.bind(mainMod .. " + SHIFT + bracketright", hl.dsp.window.move({ workspace = "+1" }))
hl.bind(mainMod .. " + SHIFT + bracketleft", hl.dsp.window.move({ workspace = "-1" }))



-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

-- Laptop multimedia keys
hl.bind("XF86AudioRaiseVolume",
	hl.dsp.exec_cmd(
		"wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+; dunstify --replace-id 666 \"$(wpctl get-volume @DEFAULT_SINK@)\""),
	{ locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",
	hl.dsp.exec_cmd(
		"wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-; dunstify --replace-id 666 \"$(wpctl get-volume @DEFAULT_SINK@)\""),
	{ locked = true, repeating = true })
hl.bind("XF86AudioMute",
	hl.dsp.exec_cmd(
		"wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle; dunstify --replace-id 666 \"$(wpctl get-volume @DEFAULT_SINK@)\""),
	{ locked = true })
hl.bind("XF86AudioMicMute",
	hl.dsp.exec_cmd(
		"wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle; dunstify --replace-id 666 \"Microphone $(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)\""),
	{ locked = true })
hl.bind("XF86MonBrightnessUp",
	hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+; dunstify --replace-id 667 \"Brightness: $(brightnessctl get)\""),
	{ locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",
	hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-; dunstify --replace-id 667 \"Brightness: $(brightnessctl get)\""),
	{ locked = true, repeating = true })

-- Playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Move workspace to monitor
hl.bind(mainMod .. " + SHIFT + LEFT", hl.dsp.workspace.move({ monitor = "+1" }))
hl.bind(mainMod .. " + SHIFT + RIGHT", hl.dsp.workspace.move({ monitor = "-1" }))

------------------
-- WINDOW RULES --
------------------
-- Ignore maximize requests from all apps
hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize"
})

-- Fix some dragging issues with XWayland
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false
	},
	no_focus = true
})

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },
	move = { "20", "monitor_h-120" },
	float = true
})

-- Jetbrains IDEs (e.g., Android Studio)
hl.window_rule({
	name = "no-initial-focus-jetbrains",
	match = { class = "jetbrains-studio", title = "^win(.*)" },
	no_initial_focus = true
})
