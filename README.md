# nvim-winnav

Simple plugin to seamlessly navigate between Neovim windows and your window manager. Inspired by [vim-sway-nav](https://git.sr.ht/~jcc/vim-sway-nav).

## Install

```lua
{
    "amedoeyes/nvim-winnav"
    opts = {}
}
```

## Setup

First you need to configure the plugin.

```lua
opts = {
    -- this is the command your window manager uses to move focus
    focus_command = { "cmd", "move-focus" },
    -- the keys are the directions the plugin uses to navigate and the values
    -- are the directions your focus command uses
    direction_map = {
        h = "left",
        l = "right",
        k = "up",
        j = "down",
    },
}
```

Next you'll need to configure and use this [script](./nvim-winnav.sh) for navigation.

## Examples

### Sway

```lua
opts = {
    focus_command = { "swaymsg", "focus" },
    direction_map = {
        h = "left",
        l = "right",
        k = "up",
        j = "down",
    },
},
```

```bash
ACTIVE_WINDOW_PID=$(swaymsg -t get_tree | jq '.. | select(.focused? == true).pid')
FOCUS="swaymsg focus"
DIRECTION_LEFT="left"
DIRECTION_RIGHT="right"
DIRECTION_UP="up"
DIRECTION_DOWN="down"
```

```
bindsym mod4+h exec nvim-winnav left
bindsym mod4+j exec nvim-winnav down
bindsym mod4+k exec nvim-winnav up
bindsym mod4+l exec nvim-winnav right
```

### Hyprland

```lua
opts = {
    focus_command = { "hyprctl", "dispatch", "movefocus" },
    direction_map = {
        h = "l",
        l = "r",
        k = "u",
        j = "d",
    },
},
```

```bash
ACTIVE_WINDOW_PID=$(hyprctl activewindow -j | jq '.pid')
FOCUS="hyprctl dispatch movefocus"
DIRECTION_LEFT="l"
DIRECTION_RIGHT="r"
DIRECTION_UP="u"
DIRECTION_DOWN="d"
```

```
bind = SUPER, H, exec, nvim-winnav l
bind = SUPER, L, exec, nvim-winnav r
bind = SUPER, K, exec, nvim-winnav u
bind = SUPER, J, exec, nvim-winnav d
```
