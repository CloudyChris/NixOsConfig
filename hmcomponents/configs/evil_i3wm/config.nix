{ pkgs, lib, config, ... }:

let
  global_i3 = config.services.xserver.windowManager.i3.enable;
  modifier = config.xsession.windowManager.i3.config.modifier;
in
{
  config = lib.mkif (global_i3) {
    xsession.windowManager.i3 = {
      enable = true;
      package = pkgs.i3-rounded;
      config = {
        modifier = "Mod4";
        # making sure no default keybinds stick around
        keybindings = "";
      };
      # TODO make eww widget for whichkey to launch after entering any mode whatsoever
      extraConfig = ''
        #~ Mouse behavior
        mouse_warping output
        focus_follows_mouse yes

        #~ Floating windows drag
        floating_modifier Mod4

        #~ Tiled windows drag
        tiling_drag modifier titlebar
        tiling_drag swap_modifier Mod4

        #~ Urgent windows and hits
        force_display_urgency_hint 1000 ms

        #~ Focus
        focus_on_window_activation urgent

        #~ Popups
        popup_during_fullscreen smart

        #~ Workspaces
        workspace_auto_back_and_forth no
        set $ws_1 "1"
        set $ws_2 "2"
        set $ws_3 "3"
        set $ws_4 "4"
        set $ws_5 "5"

        #~ Change container focus (Alt-Tab)
        bindysm Mod1+Tab exec "rofi -show window -show-icons -icon-theme \\"$ICON_THEME\\" -theme \\"$ROFI_WIN\\""

        #~ Audio Keybinds
        bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10%
        bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10%
        bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle
        bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle
        bindsym XF86AudioPlay exec --no-startup-id playerctl play
        bindsym XF86AudioPause exec --no-startup-id playerctl pause
        bindsym XF86AudioNext exec --no-startup-id playerctl next
        bindsym XF86AudioPrev exec --no-startup-id playerctl prev

        #################################################################################################################### Evil Keybinds
        set $mode_leader Leader: [a]udio [b]luetooth [c]lient [h]elp [i]3wm [l]ayout [o]pen [r]un [s]ysmenu [v]iew [w]orkspace

        set $mode_client Client: [f]ullscreen [k]ill f[l]oat [m]ove [s]mark [u]nmark
        set $mode_i3wm i3wm: [c]ommand [e]xit re[l]oad [r]estart
        set $mode_layout Layout: [h]orizontal-split [v]ertical-split
        set $mode_open Open: [b]rowser [e]ditor [f]iles [h]top [p]rograms [s]team [t]erminal
        set $mode_run Run: [r]un as-[s]uperuser
        set $mode_systemnu System Menu: [h]ibernate [l]ock log-[o]ut [p]oweroff [r]estart [s]leep
        set $mode_view View: [c]lipboard-history [k]eyboard-layouts [s]cratchpad-containers
        set $mode_workspace Workspace: [m]ove [n]ext [p]revious

        set $mode_client_move Move client: [l]eft [r]ight [u]p [d]own to-[s]creen to-[workspace]
        set $mode_client_after_move And: [g]o [s]tay
        set $mode_client_resize Resize client: [←] [→] [↑] [↓]

        bindsym Mod4+Space mode $mode_leader

        mode "$mode_leader" {
             # TODO 2
             bindsym a exec "notify-send \\"Audio widget not implemented\\""; mode default
             bindsym b exec "notify-send \\"Bluetooth widget not implemented\\""; mode default
             bindsym c mode $mode_client
             # TODO 1
             bindsym h exec "notify-send \\"Help not implemented\\""; mode default
             bindsym i mode $mode_i3wm
             bindsym l mode $mode_layout
             bindsym o mode $mode_open
             bindsym r exec "rofi -show run -show-icons -icon-theme \\"$ICON_THEME\\" -theme \\"$ROFI_RUN\\""; mode default
             # TODO 1
             bindsym s exec "notify-send \\"System menu not implemented\\""; mode $mode_sysmenu
             bindsym v mode $mode_view
             bindsym w mode $mode_window
             bindysm Escape mode default;
             bindsym Return mode default
        }

        mode "$mode_client" {
             bindsym f fullscreen toggle; mode default
             bindsym k kill; mode default
             bindsym l floating toggle; mode default
             bindsym m mode $mode_client_move
             bindysm r mode $mode_client_resize
             # TODO 2
             bindsym s exec "notify-send \\"Mark menu not implemented\\""; mode default
             bindsym u exec "notify-send \\"Unmark menu not implemented\\""; mode default
             bindsym Escape mode default
             bindsym Return mode default
        }

        mode "$mode_i3wm" {
             # TODO 1
             bindsym c exec "notify-send \\"i3 command dialogue not implemented\\""; mode default
             bindsym e exit
             bindsym l reload
             bindsym r restart
             bindsym Escape mode default
             bindsym Return mode default
        }

        mode "$mode_layout" {
             bindsym h split h; mode default
             bindsym v split v; mode default
             bindsym Escape mode default
             bindsym Return mode default
        }

        mode "$mode_open" {
             bindsym b exec $BROWSER; mode default
             bindsym e exec $EDITOR; mode default
             bindsym f exec $FILEX; mode default
             bindsym h exec "$TERMINAL -e htop"; mode default
             bindsym p exec "rofi -show drun -show-icons -icon-theme \\"$ICON_THEME\\" -theme \\"$ROFI_DRUN\\"" ; mode default
             bindsym s exec steam; mode default
             bindsym t exec $TERMINAL; mode default
             bindsym Escape mode default
             bindsym Return mode default
        }

        mode "$mode_sysmenu" {
             # TODO 3
             bindsym h exec "notify-send \\"Hibernate not implemented\\""; mode default
             bindsym l exec "notify-send \\"Lock not implemented\\""; mode default
             bindsym o exec "notify-send \\"Log out not implemented\\""; mode default
             bindsym p systemctl poweroff
             bindsym r systemctl reboot
             # TODO 1
             bindsym s exec "notify-send \\"Sleep not implemented\\""; mode default
             bindsym Escape mode default
        }

        mode "$mode_view" {
             bindsym c exec "clipmenu"; mode default
             # TODO 1
             bindsym k exec "notify-send \\"Keyboard layouts not implemented\\""; mode default
             bindsym Escape mode default
             bindsym Return mode default
        }

        mode "$mode_workspace" {
             # TODO 1
             bindsym m exec "notify-send \\"Workspace move menu not implemented\\""; mode default
             bindsym n workspace next; mode default
             bindsym p workspace prev; mode default
             bindsym Escape mode default
             bindsym Return mode default
        }

        mode "$mode_client_move" {
             bindsym l move left
             bindsym r move right
             bindsym u move up
             bindsym d move down
             # TODO 2
             # the menu these open should set a var somewhere to be used by mode_client_after_move
             bindsym s exec "notify-send \\"Move to screen menu not implemented\\""; mode default
             bindsym w exec "notify-send \\"Move to workspace menu not implemented\\""; mode default
             bindsym Escape mode default
             bindsym Return mode default
        }

        mode "$mode_client_after_move" {
             # TODO 1
             bindsym g exec "notify-send \\"Client move to screen and workspace menus not implemented\\""; mode default
             bindsym s mode default
             bindsym Escape mode default
             bindsym Return mode default
        }

        mode "$mode_client_resize" {
             bindsym Left resize shrink width 10 px or 10 ppt
             bindsym Right resize grow width 10 px or 10 ppt
             bindsym Up resize grow height 10 px or 10 ppt
             bindsym Down resize shrink height 10px or 10 ppt
             bindsym Escape mode default
             bindsym Return mode default
        }
      '';
    };
  };
}
