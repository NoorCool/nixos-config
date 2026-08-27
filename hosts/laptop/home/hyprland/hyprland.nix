{ pkgs, ...}:

{
	wayland.windowManager.hyprland = {
		enable = true;

		configType = "lua";

		extraConfig = ''
				
				hl.monitor({
					output = "eDP-1",
					mode = "2256x1504@60",
					position = "0x0",
					scale = "1.33",
				})

				hl.monitor({
					output = "DP-1",
					mode = "1920x1080@60",
					position = "0x-1080",
					scale = "1.00",
				})

				local terminal = "kitty"
				local menu = "rofi -show drun"

				hl.on("hyprland.start", function ()
					hl.exec_cmd("waybar")
					hl.exec_cmd("swaybg -i " .. os.getenv("HOME") .. "/.config/current-wallpaper -m fill")
					hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24")
				end)

				hl.env("XCURSOR_SIZE", "24")
				hl.env("HYPRCURSOR_SIZE", "24")

				hl.config({
					general = {
						gaps_in = 5,
						gaps_out = 5,
						border_size = 2,

						col = {
							active_border = "rgb(A7C089)",
							inactive_border = "rgb(343F44)",
						},

						resize_on_border = false,

						allow_tearing = false,

						layout = "dwindle",
					},

					decoration = {
						rounding = 0,
						rounding_power = 0,

						active_opacity = 1.0,
						inactive_opacity = 0.9,

						shadow = { enabled = false, },

						blur = {
							enabled = true,
							size = 3,
							passes = 1,
							vibrancy = 0.1696,
						},
					},

					animations = { enabled = true, },

					dwindle = { preserve_split = true, },

					master = { new_status = "master", },

					scrolling = { fullscreen_on_one_column = true, },

					misc = {
						force_default_wallpaper = 0,
						disable_hyprland_logo = true,
					},

					input = {
						kb_layout = "be",
						kb_variant = "",
						kb_model = "pc105",
						kb_options = "caps:shiftlock",
						kb_rules = "",

						follow_mouse = 1,

						sensitivity = 0,

						touchpad = {
							natural_scroll = true,
							tap_to_click = true,
							tap_and_drag = true,
							disable_while_typing = true,
						},
					},
				})

				hl.device({
					name = "epic-mouse-v1",
					sensitivity = -0.5,
				})

				-- Animations
				hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
				hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
				hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
				hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
				hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

				hl.curve("easy",           { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })

				hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
				hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
				hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
				hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
				hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
				hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
				hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
				hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
				hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
				hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
				hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
				hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
				hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
				hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
				hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
				hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
				hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

				--- Necessary keybinds
				local mainMod = "SUPER"
				hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
				local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())

				-- General keybinds
				hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
				hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
				hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
				hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
				hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprshot -m output --clipboard-only"))
				hl.bind(mainMod .. " + SHIFT + Print", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
				hl.bind(mainMod .. " + Delete", hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/rofi/powermenu/powermenu.sh"))
				hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/rofi/wallpaperselector/wallpaperselector.sh"))

				-- Move focus window
				hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
				hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
				hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
				hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

				-- Switch workspaces
				for i = 1, 10 do
					local code = i + 9

					hl.bind(mainMod .. " + code:" .. code,
						hl.dsp.focus({ workspace = i }))

					hl.bind(mainMod .. " + SHIFT + code:" .. code,
						hl.dsp.window.move({ workspace = i }))
				end

				-- Scroll through existing workspaces with mainMod + scroll
				hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
				hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

				-- Move/resize windows with mainMod + LMB/RMB and dragging
				hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
				hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

				-- Laptop multimedia keys for volume and LCD brightness
				hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
				hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
				hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
				hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
				hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
				hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

				-- Requires playerctl
				hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
				hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
				hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
				hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

		'';
	};
}
