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
        set $ws_editor "5: Editor"
        set $ws_browser "6: Browser"
        set $ws_social "7: Social"
        set $ws_box_1 "8: Box 1"
        set $ws_box_2 "9: Box 2"
        set $ws_zero "0"

        #~ Change container focus (Alt-Tab)
        bindysm Mod1+Tab rofi -- show containers to focus to TODO

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
        set $mode_leader Leader: [a]udio [b]luetooth [c]lient [h]elp [i]3wm [l]ayout [o]pen [p]anel [r]un [s]ysmenu [v]iew [w]orkspace

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

        bindsym Mod4+Space mode $mode_leader

        mode "$mode_leader" {
             bindsym a eww -- audio widget; mode default TODO
             bindsym b eww -- bluetooth widget; mode default TODO
             bindsym c mode $mode_client
             bindsym h eww -- help widget; mode default TODO
             bindsym i mode $mode_i3wm
             bindsym l mode $mode_layout
             bindsym o mode $mode_open
             bindsym p eww -- panel widgets; mode default TODO
             bindsym r mode $mode_run
             bindsym s rofi -- sysmenu menu; mode $mode_sysmenu TODO
             bindsym v mode $mode_view
             bindsym w mode $mode_window
             bindysm Escape mode default;
             bindsym Return mode default
        }

        mode "$mode_client" {
             bindsym f fullscreen toggle; mode default
             bindsym k kill; mode default
             bindsym l floating toggle; mode default
             bindsym m mode $mode_client_move;
             bindsym s rofi -- mark menu; mode default TODO
             bindsym u rofi -- unmark menu; mode default TODO;
             bindsym Escape mode default
             bindsym Return mode default
        }

        mode "$mode_i3wm" {
             bindsym c rofi -- i3 command; mode default TODO
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
             bindsym b -- open browser; mode default TODO
             bindsym e -- open editor; mode default TODO
             bindsym f -- open files explorer; mode default TODO
             bindsym h -- open htop in default terminal; mode default TODO
             bindsym p rofi -- drun programs list; mode default TODO
             bindsym s -- run steam; mode default TODO
             bindsym t -- open default terminal; mode default TODO
             bindsym Escape mode default
             bindsym Return mode default
        }

        mode "$mode_run" {
             bindsym r rofi -- run command; mode default TODO
             bindsym s rofi -- run as superuser; mode default TODO
             bindsym Escape mode default
             bindsym Return mode default
        }

        mode "$mode_sysmenu" {
             bindsym h -- hibernate; mode default TODO
             bindsym l -- lock (i3lock); mode default TODO
             bindsym o -- log out; mode default TODO
             bindsym p systemctl poweroff
             bindsym r systemctl reboot
             bindsym s -- sleep (+i3lock); mode default TODO
             bindsym Escape mode default
             bindsym Return mode default
        }

        mode "$mode_view" {
             bindsym c rofi -- clipboard history; mode default TODO
             bindsym k rofi -- keyboard layouts; mode default TODO
             bindsym Escape mode default
             bindsym Return mode default
        }

        mode "$mode_workspace" {
             bindsym m rofi -- move to workspace; mode default TODO
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
             bindsym s rofi -- move to screen menu; mode default TODO
             bindsym w rofi -- move to workspace menu; mode default TODO
             bindsym Escape mode default
             bindsym Return mode default
        }
      '';
    };
  };
}
