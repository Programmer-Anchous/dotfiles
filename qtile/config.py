# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
# Copyright (c) 20XX Froloket64
#
# Permission is hereby granted, free o charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import subprocess

from libqtile import qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile import layout, bar, hook
from libqtile.lazy import lazy

mod = "mod4"
terminal = "alacritty"
browser = "firefox"
file_manager = "nemo"

# Key Binds
keys = [
    # SCREENSHOTS
    Key([], "Print", lazy.spawn(
        "scrot 'Screenshot-from-%Y-%m-%d-%s_screenshot_$wx$h.png' -e 'mv $f Pictures/Screenshots'")),

    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),

    Key([mod, "control"], "h", lazy.spawn(
        f"{terminal} -e htop"), desc="Run htop in the chosen terminal"),
    Key([mod, "control"], "b", lazy.spawn(
        f"{terminal} -e btop"), desc="Run btop in the chosen terminal"),

    # The essentials
    Key([mod], "Return",
        lazy.spawn(terminal + " -e fish"),
        desc='Launches My Terminal'
        ),
    Key([mod, "shift"], "Return",
        lazy.spawn("dm-run"),
        desc='Run Launcher'
        ),
    Key([mod], "b",
        lazy.spawn(browser),
        desc='FireFox'
        ),

    # Volume
    Key([mod, "control"], "u",
        lazy.spawn("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
        desc='upper volume'
        ),
    Key([mod, "control"], "l",
        lazy.spawn("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
        desc='lower volume'
        ),
    Key([mod, "control"], "m",
        lazy.spawn("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
        desc='mute/unmute'
        ),

    # Websites
    # phind.com
    Key([mod], "p",
        lazy.spawn(browser + " phind.com"),
        desc='open phind.com'
        ),
    Key([mod, "control"], "p",
        lazy.spawn(browser + " --new-window phind.com"),
        desc='open phind.com'
        ),
    # translate.yandex.com
    Key([mod], "t",
        lazy.spawn(browser + " translate.yandex.com/en/"),
        desc='open phind.com'
        ),
    Key([mod, "control"], "t",
        lazy.spawn(browser + " --new-window translate.yandex.com/en/"),
        desc='open phind.com'
        ),

    # Applications
    Key([mod], "e",
        lazy.spawn(terminal + " -e ranger"),
        desc='File manager'
        ),
    Key([mod], "d",
        lazy.spawn("rofi -show drun"),
        desc="Run app launcher (rofi here)"
        ),

    # System shortcuts
    Key([mod], "c",
        lazy.window.kill(),
        desc='Kill active window'
        ),
    Key([mod, "shift"], "r",
        lazy.restart(),
        desc='Restart Qtile'
        ),
    Key([mod, "shift"], "q",
        lazy.shutdown(),
        desc='Shutdown Qtile'
        ),
    # Window controls
    Key([mod], "j",
        lazy.layout.down(),
        desc='Move focus down in current stack pane'
        ),
    Key([mod], "k",
        lazy.layout.up(),
        desc='Move focus up in current stack pane'
        ),

    Key([mod, "shift"], "j",
        lazy.layout.shuffle_down(),
        lazy.layout.section_down(),
        desc='Move windows down in current stack'
        ),
    Key([mod, "shift"], "k",
        lazy.layout.shuffle_up(),
        lazy.layout.section_up(),
        desc='Move windows up in current stack'
        ),

    Key([mod], "h",
        lazy.layout.shrink(),
        lazy.layout.decrease_nmaster(),
        desc='Shrink window (MonadTall), decrease number in master pane (Tile)'
        ),
    Key([mod], "l",
        lazy.layout.grow(),
        lazy.layout.increase_nmaster(),
        desc='Expand window (MonadTall), increase number in master pane (Tile)'
        ),

    Key([mod], "n",
        lazy.layout.normalize(),
        desc='normalize window size ratios'
        ),
    Key([mod], "m",
        lazy.layout.maximize(),
        desc='toggle window between minimum and maximum sizes'
        ),

    # layout settings
    Key([mod, "shift"], "f",
        lazy.window.toggle_floating(),
        desc='toggle floating'
        ),
    Key([mod], "f",
        lazy.window.toggle_fullscreen(),
        desc='toggle fullscreen'
        ),
    Key([mod], "space",
        lazy.layout.flip()
        )
]

# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(
                func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )

groups_names = [
    {'name': 'TRM '},
    {'name': 'WOR '},
    {'name': 'COD '},
    {'name': 'WEB '},
    {'name': 'PUB ', 'spawn': ['telegram-desktop']},
    {'name': 'DIS '},
    {'name': 'STM '},
    {'name': 'GAM '},
    {'name': 'FRE '}
]
groups = [Group(**args) for args in groups_names]

for num, i in enumerate(groups, start=1):
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [mod],
                str(num),
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                str(num),
                lazy.window.togroup(i.name, switch_group=False),
                desc="Switch to & move focused window to group {}".format(
                    i.name),
            ),
        ]
    )

layout_theme = {"border_width": 2,
                "margin": 5,
                "border_focus": "#A7C080",
                "border_normal": "#7A8478",
                # "border_focus": "#689d6a",
                # "border_normal": "#928374",
                }

layouts = [
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.Floating(**layout_theme)
]
floating_layout = layout.Floating(**layout_theme)

widget_defaults = {
    "font": 'Ubuntu Mono',
    "fontsize": 14,
    "padding": 3,
}

extension_defaults = widget_defaults.copy()
widgetSep_defaults = {
    'linewidth': 0,
    'padding': 10
}

window_offset = 1
screens = [Screen(
    left=bar.Gap(1),
    right=bar.Gap(1),
    bottom=bar.Gap(1),
    top=bar.Gap(1)
)]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"


# When using the Wayland backend, this can be used to configure input devices.
# wl_input_rules = None

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    hom = os.path.expanduser('~/.config/qtile/xsettings.sh')
    subprocess.Popen([home, hom])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
