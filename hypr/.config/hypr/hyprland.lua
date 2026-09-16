-- ============================================================
-- hyprland.lua
-- ============================================================

------------------
---- MONITORS ----
------------------

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1,
})

hl.config({
    debug = {
        disable_scale_checks = false,
    },
})


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "20")
hl.env("XCURSOR_THEME", "McMojave-cursors")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")


---------------------
---- MY PROGRAMS ----
---------------------

local mainMod = "SUPER"

local terminal = "kitty"
local fileManager = "nemo"
local browser = "google-chrome-stable"


-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar & hypridle & nm-applet & kdeconnectd & blueman-applet")

    -- CopyQ
    hl.exec_cmd("env QT_QPA_PLATFORM=xcb copyq")

    -- Wallpaper
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("awww img ~/Pictures/bg_world.jpeg")

    -- Clipboard history: text
    hl.exec_cmd("wl-paste --type text --watch cliphist store")

    -- Clipboard history: images
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- Polkit authentication agent
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")

    -- Keep clipboard available after applications close
    hl.exec_cmd("wl-clip-persist --clipboard regular")
end)


-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 6,

        border_size = 1,

        col = {
            active_border = {
                colors = {
                    "rgba(40,60,60,1)",
                    "rgba(40,40,40,1)",
                },
                angle = 60,
            },

            inactive_border = {
                colors = {
                    "rgba(40,40,40,1)",
                    "rgba(40,40,40,1)",
                },
                angle = 60,
            },
        },

        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding = 3,
        rounding_power = 2,

        active_opacity = 1,
        inactive_opacity = 1,

        dim_around = 0.5,
        dim_special = 0.3,

        shadow = {
            enabled = true,
            range = 20,
            render_power = 5,
            color = 0x55000000,
            offset = { 0, 3 },
        },

        blur = {
            enabled = true,
            size = 15,
            passes = 3,
            vibrancy = 0.17,
        },
    },

    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = true,
        focus_on_activate = true,
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_on_top = false,
        allow_small_split = false,
        mfact = 0.57,
    },

    cursor = {
        no_warps = true,
        enable_hyprcursor = true,
    },

    xwayland = {
        force_zero_scaling = true,
    },

    render = {
        new_render_scheduling = true,
    },

    animations = {
        enabled = true,
    },
})


-----------------
---- ANIMATIONS --
-----------------

hl.curve(
    "easeOutQuint",
    {
        type = "bezier",
        points = {
            { 0.23, 1 },
            { 0.32, 1.03 },
        },
    }
)

hl.curve(
    "easeInOutCubic",
    {
        type = "bezier",
        points = {
            { 0.65, 0.05 },
            { 0.36, 1 },
        },
    }
)

hl.curve(
    "linear",
    {
        type = "bezier",
        points = {
            { 0, 0 },
            { 1, 1 },
        },
    }
)

hl.curve(
    "almostLinear",
    {
        type = "bezier",
        points = {
            { 0.5, 0.5 },
            { 0.75, 1.0 },
        },
    }
)

hl.curve(
    "quick",
    {
        type = "bezier",
        points = {
            { 0.15, 0 },
            { 0.1, 1 },
        },
    }
)

hl.animation({
    leaf = "global",
    enabled = true,
    speed = 10,
    bezier = "default",
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 5.39,
    bezier = "easeOutQuint",
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 4.79,
    bezier = "easeOutQuint",
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 3,
    bezier = "easeOutQuint",
    style = "popin 80%",
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 1.5,
    bezier = "easeOutQuint",
    style = "popin 80%",
})

hl.animation({
    leaf = "fadeIn",
    enabled = true,
    speed = 2.73,
    bezier = "easeOutQuint",
})

hl.animation({
    leaf = "fadeOut",
    enabled = true,
    speed = 3.3,
    bezier = "easeOutQuint",
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3.03,
    bezier = "quick",
})

hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 3.81,
    bezier = "easeOutQuint",
})

hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 3,
    bezier = "easeOutQuint",
    style = "fade",
})

hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 3,
    bezier = "easeOutQuint",
    style = "fade",
})

hl.animation({
    leaf = "fadeLayersIn",
    enabled = true,
    speed = 1,
    bezier = "almostLinear",
})

hl.animation({
    leaf = "fadeLayersOut",
    enabled = true,
    speed = 1,
    bezier = "almostLinear",
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 3,
    bezier = "easeOutQuint",
    style = "slidefade 10%",
})

hl.animation({
    leaf = "workspacesIn",
    enabled = true,
    speed = 3,
    bezier = "easeOutQuint",
    style = "slidefade 10%",
})

hl.animation({
    leaf = "workspacesOut",
    enabled = true,
    speed = 3,
    bezier = "easeOutQuint",
    style = "slidefade 10%",
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_rules = "",

        follow_mouse = 1,
        accel_profile = "adaptive",
        force_no_accel = false,
        scroll_factor = 1,
        sensitivity = 1,

        touchpad = {
            natural_scroll = true,
        },

        numlock_by_default = true,
    },

    binds = {
        hide_special_on_workspace_change = true,
        scroll_event_delay = 80,
        drag_threshold = 2,
    },
})


---------------------
---- PER-DEVICE -----
---------------------

hl.device({
    name = "elan0731:00-04f3:3169-touchpad",
    sensitivity = 0.5,
})


---------------------
---- KEYBINDINGS ----
---------------------

-- Mouse movement
hl.bind(
    mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

hl.bind(
    mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)


-------------------------
---- VOLUME / BRIGHTNESS
-------------------------

local volumeMakoIndicator = "~/.config/mako/volumeNotification.sh"
local brightnessMakoIndicator = "~/.config/mako/brightnessNotification.sh"

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 10%+ && "
        .. volumeMakoIndicator
    ),
    {
        locked = true,
        repeating = true,
    }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%- && "
        .. volumeMakoIndicator
    ),
    {
        locked = true,
        repeating = true,
    }
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && "
        .. volumeMakoIndicator
    ),
    {
        locked = true,
        repeating = true,
    }
)

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd(
        "brightnessctl s 10%+ && "
        .. brightnessMakoIndicator
    ),
    {
        locked = true,
        repeating = true,
    }
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd(
        "brightnessctl s 10%- && "
        .. brightnessMakoIndicator
    ),
    {
        locked = true,
        repeating = true,
    }
)

hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ),
    {
        locked = true,
        repeating = true,
    }
)


----------------
---- PLAYERCTL --
----------------

hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"),
    { locked = true }
)

hl.bind(
    "XF86AudioPause",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)

hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)

hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"),
    { locked = true }
)


----------------------
---- WORKSPACES ------
----------------------

-- SUPER + 1..0
-- SUPER + SHIFT + 1..0

for i = 1, 10 do
    local key = i % 10

    hl.bind(
        mainMod .. " + " .. key,
        hl.dsp.focus({ workspace = i })
    )

    hl.bind(
        mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i })
    )
end


-- Physical keycodes for non-US layouts
local wsCodes = {
    87, 88, 89, 83, 84,
    85, 79, 80, 81, 90,
}

for i = 1, 10 do
    hl.bind(
        mainMod .. " + code:" .. wsCodes[i],
        hl.dsp.focus({ workspace = i })
    )

    hl.bind(
        mainMod .. " + SHIFT + code:" .. wsCodes[i],
        hl.dsp.window.move({ workspace = i })
    )
end


-------------------
---- APPLICATIONS -
-------------------

hl.bind(
    mainMod .. " + Return",
    hl.dsp.exec_cmd(terminal)
)

hl.bind(
    mainMod .. " + Q",
    hl.dsp.window.close()
)

hl.bind(
    mainMod .. " + E",
    hl.dsp.exec_cmd(
        "bash -c '" .. fileManager
        .. " && ~/.local/bin/ftp-redmi-bookmark'"
    )
)

hl.bind(
    mainMod .. " + X",
    hl.dsp.window.float({ action = "toggle" })
)

hl.bind(
    mainMod .. " + O",
    hl.dsp.layout("rotatesplit")
)

hl.bind(
    mainMod .. " + P",
    hl.dsp.window.pseudo()
)

hl.bind(
    mainMod .. " + B",
    hl.dsp.exec_cmd(browser)
)


-------------------------
---- FULLSCREEN / MAX ---
-------------------------

-- SUPER + W = maximize
hl.bind(
    mainMod .. " + W",
    hl.dsp.window.fullscreen({
        mode = "maximized",
    })
)

-- SUPER + SHIFT + F = normal fullscreen toggle
hl.bind(
    mainMod .. " + F",
    hl.dsp.window.fullscreen()
)

-- SUPER + F = force fullscreen while keeping client non-fullscreen
-- This prevents Chromium-style apps from entering presentation mode.
hl.bind(
    mainMod .. " + SHIFT + F",
    hl.dsp.window.fullscreen({
        internal = 2,
        client = 0,
    })
)


----------------
---- ROFI ------
----------------

hl.bind(
    mainMod .. " + SPACE",
    hl.dsp.exec_cmd("pkill rofi || rofi -show drun")
)

hl.bind(
    mainMod .. " + R",
    hl.dsp.exec_cmd("pkill rofi || rofi -show filebrowser")
)


-------------------
---- HYPRSHOT -----
-------------------

local hyprshotOutput = "~/Pictures/hyprshot"

hl.bind(
    "SHIFT + print",
    hl.dsp.exec_cmd(
        "hyprshot -m output -m eDP-1 -o " .. hyprshotOutput
    )
)

hl.bind(
    "print",
    hl.dsp.exec_cmd(
        "pkill slurp || hyprshot -m region -o " .. hyprshotOutput
    )
)


-----------------
---- WLOGOUT ----
-----------------

hl.bind(
    mainMod .. " + L",
    hl.dsp.exec_cmd("pkill wlogout || wlogout")
)


-----------------
---- HYPRLOCK ---
-----------------

hl.bind(
    "switch:on:Lid Switch",
    hl.dsp.exec_cmd("hyprlock"),
    { locked = true }
)


-------------------
---- FOCUS --------
-------------------

hl.bind(
    mainMod .. " + left",
    hl.dsp.focus({ direction = "left" })
)

hl.bind(
    mainMod .. " + right",
    hl.dsp.focus({ direction = "right" })
)

hl.bind(
    mainMod .. " + up",
    hl.dsp.focus({ direction = "up" })
)

hl.bind(
    mainMod .. " + down",
    hl.dsp.focus({ direction = "down" })
)


---------------------
---- SPECIAL WS -----
---------------------

hl.bind(
    mainMod .. " + S",
    hl.dsp.workspace.toggle_special("magic")
)

hl.bind(
    mainMod .. " + SHIFT + S",
    hl.dsp.window.move({
        workspace = "special:magic",
    })
)


----------------------------
---- WORKSPACE SCROLLING ---
----------------------------

hl.bind(
    mainMod .. " + mouse_down",
    hl.dsp.focus({ workspace = "e+1" })
)

hl.bind(
    mainMod .. " + mouse_up",
    hl.dsp.focus({ workspace = "e-1" })
)


-------------------
---- WINDOW CYCLE -
-------------------

hl.bind(
    mainMod .. " + Tab",
    function()
        hl.dispatch(hl.dsp.window.cycle_next())
        hl.dispatch(hl.dsp.window.bring_to_top())
    end
)


------------------------
---- WORKSPACE CYCLE ---
------------------------

hl.bind(
    mainMod .. " + grave",
    hl.dsp.focus({ workspace = "e+1" }),
    { repeating = true }
)

hl.bind(
    mainMod .. " + A",
    hl.dsp.focus({ workspace = "previous" })
)


--------------------
---- CLIPBOARD -----
--------------------

hl.bind(
    mainMod .. " + V",
    hl.dsp.exec_cmd("copyq toggle")
)


-----------------
---- GAMEMODE ---
-----------------

hl.bind(
    mainMod .. " + G",
    hl.dsp.exec_cmd("~/.config/hypr/scripts/gamemode.sh")
)


-----------------
---- HYPRSUNSET -
-----------------

hl.bind(
    mainMod .. " + U",
    hl.dsp.exec_cmd("pkill hyprsunset || hyprsunset -t 3500"),
    { locked = true }
)


----------------
---- WAYBAR ----
----------------

hl.bind(
    mainMod .. " + H",
    hl.dsp.exec_cmd("killall -SIGUSR1 waybar")
)

hl.bind(
    mainMod .. " + SHIFT + H",
    hl.dsp.exec_cmd("killall -SIGUSR2 waybar")
)


-----------------------
---- HYPRCTL DISPATCH -
-----------------------

hl.bind(
    mainMod .. " + C",
    hl.dsp.exec_cmd("hyprctl dispatch centerwindow")
)

hl.bind(
    mainMod .. " + Z",
    hl.dsp.exec_cmd("hyprctl dispatch swapnext")
)


------------------------
---- SPECIAL KEYCODES --
------------------------

hl.bind(
    mainMod .. " + code:21",
    hl.dsp.focus({ workspace = "empty" })
)


----------------
---- RESIZING --
----------------

hl.bind(
    mainMod .. " + code:60",
    hl.dsp.window.resize({
        x = 50,
        y = 0,
        relative = true,
    }),
    { repeating = true }
)

hl.bind(
    mainMod .. " + code:59",
    hl.dsp.window.resize({
        x = -50,
        y = 0,
        relative = true,
    }),
    { repeating = true }
)


--------------------
---- RESIZE SUBMAP -
--------------------

hl.bind(
    mainMod .. " + T",
    hl.dsp.submap("resize")
)

hl.define_submap("resize", function()

    hl.bind(
        "right",
        hl.dsp.window.resize({
            x = 50,
            y = 0,
            relative = true,
        }),
        { repeating = true }
    )

    hl.bind(
        "left",
        hl.dsp.window.resize({
            x = -50,
            y = 0,
            relative = true,
        }),
        { repeating = true }
    )

    hl.bind(
        "up",
        hl.dsp.window.resize({
            x = 0,
            y = -50,
            relative = true,
        }),
        { repeating = true }
    )

    hl.bind(
        "down",
        hl.dsp.window.resize({
            x = 0,
            y = 50,
            relative = true,
        }),
        { repeating = true }
    )

    hl.bind(
        "escape",
        hl.dsp.submap("reset")
    )
end)


-----------------------------------------
---- MAXIMIZE FEATURE / GAP HANDLING ----
-----------------------------------------


hl.workspace_rule({
    workspace = "w[tv1]",
    gaps_out = 0,
    gaps_in = 0,
})

hl.workspace_rule({
    workspace = "f[1]",
    gaps_out = 30,
    gaps_in = 0,
})


-----------------------
---- WINDOW GAP RULES -
-----------------------

hl.window_rule({
    name = "no-gaps-wtv1",
    match = {
        float = false,
        workspace = "w[tv1]",
    },
    border_size = 0,
    rounding = 0,
})



hl.window_rule({
    name = "gaps-wtv1-f1",
    match = {
        float = false,
        workspace = "w[tv1]f[1]",
    },
    border_size = 1,
    rounding = 4,
})




--[[

hl.window_rule({
    name = "gaps-wtv1-fv1-f1",
    match = {
        float = false,
        workspace = "w[tv1]w[fv1-999]f[1]",
    },
    border_size = 80,
    rounding = 2,
}) 

]]

--------------------------
---- SPECIAL WS RULES ----
--------------------------

hl.workspace_rule({
    workspace = "s[true]",
    gaps_out = 30,
    gaps_in = 4,
})

hl.workspace_rule({
    workspace = "s[true]f[1]",
    gaps_out = 60,
    gaps_in = 4,
})

hl.window_rule({
    name = "special-workspace-border",
    match = {
        float = false,
        workspace = "s[true]",
    },
    border_size = 1,
    rounding = 2,
})


---------------------
---- LAYER RULES ----
---------------------

-- HyprPanel
hl.layer_rule({
    match = {
        namespace = "^bar-0$",
    },
    blur = true,
    ignore_alpha = 0,
})

-- Waybar
hl.layer_rule({
    match = {
        namespace = "^waybar$",
    },
    blur = true,
    ignore_alpha = 0,
})

-- Rofi
hl.layer_rule({
    match = {
        namespace = "^rofi$",
    },
    blur = true,
    ignore_alpha = 0,
    dim_around = true,
    animation = "popin 94%",
})

-- HyprPanel notifications
hl.layer_rule({
    match = {
        namespace = "^notifications-window$",
    },
    blur = true,
    ignore_alpha = 0,
})

-- Mako notifications
hl.layer_rule({
    match = {
        namespace = "^notifications$",
    },
    blur = true,
    ignore_alpha = 0,
})

-- Disable animations for picker/selection
hl.layer_rule({
    match = {
        namespace = "^hyprpicker$",
    },
    no_anim = true,
})

hl.layer_rule({
    match = {
        namespace = "^selection$",
    },
    no_anim = true,
})


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- Prevent applications from changing our maximize state
hl.window_rule({
    name = "suppress-maximize-events",
    match = {
        class = ".*",
    },
    suppress_event = "maximize",
})


-------------------------------------
---- XWAYLAND DRAGGING FIX ----------
-------------------------------------

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})


------------------------
---- FLOATING APPS -----
------------------------

local floatApps =
    "blueman-manager"
    .. "|org.gnome.Calculator"
    .. "|org.pulseaudio.pavucontrol"
    .. "|org.kde.kdeconnect.app"
    .. "|org.kde.kdeconnect.daemon"
    .. "|localsend"
    .. "|nm-connection-editor"
    .. "|scrcpy"
    .. "|com.github.hluk.copyq"
    .. "|copyq"
    .. "|chrome-hnpfjngllnobngcgfapefoaidbinmjnm-Profile_9"
    .. "|org.gnome.Rhythmbox3"

hl.window_rule({
    name = "tag-float-apps",
    match = {
        class = floatApps,
    },
    tag = "+float",
})

hl.window_rule({
    name = "float-tagged",
    match = {
        tag = "float",
    },
    float = true,
})


------------------------
---- FLOATING SIZES ----
------------------------

hl.window_rule({
    match = {
        class = "blueman-manager|nm-connection-editor",
    },
    size = { 700, 400 },
})

hl.window_rule({
    match = {
        class = "org.pulseaudio.pavucontrol",
    },
    size = { 800, 600 },
})

hl.window_rule({
    match = {
        class = "localsend|org.kde.kdeconnect.app|org.kde.kdeconnect.daemon",
    },
    size = { 900, 500 },
})

hl.window_rule({
    match = {
        class = "com.github.hluk.copyq|copyq",
    },
    size = { 800, 500 },
})

hl.window_rule({
    match = {
        class = "chrome-hnpfjngllnobngcgfapefoaidbinmjnm-Profile_9",
    },
    size = { 1120, 780 },
})

hl.window_rule({
    match = {
        class = "org.gnome.Rhythmbox3",
    },
    size = { 1120, 780 },
})


---------------------
---- NEMO PROPERTIES
---------------------

hl.window_rule({
    match = {
        class = "nemo",
        title = ".*Properties$",
    },
    float = true,
})


----------------------
---- OBS / GPU REC ---
----------------------

hl.window_rule({
    match = {
        class = "com.obsproject.Studio|com.dec05eba.gpu_screen_recorder",
    },
    workspace = 10,
})


------------------
---- OPENGL -----
------------------

hl.window_rule({
    match = {
        title = "opengl",
    },
    float = true,
})

