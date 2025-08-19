{ config, pkgs, specialArgs, ... }:

let background-image = "${pkgs.xfce.xfdesktop}/share/backgrounds/xfce/xfce-leaves.svg";

in 
{ # xfce
services.xserver.enable = true;
services.xserver.desktopManager.xfce.enable = true;
services.xserver.displayManager.startx.enable = true;
services.xserver.displayManager.lightdm.enable = true;
# services.xserver.displayManager.lightdm.extraConfig = ''
# background = ${background-image}
# '';
# services.xserver.displayManager.lightdm.greeters.gtk.extraConfig = ''
# background = ${background-image}
# '';
services.xserver.xkb.layout = "us";
services.xserver.xkb.variant = "";
# excludePackages = with pkgs; [ xterm ];

# system
environment.systemPackages = with pkgs; [
];

environment.xfce.excludePackages = with pkgs; [ ];

# home
users.users.${specialArgs.user}.packages = with pkgs; [
];

home-manager.users.${specialArgs.user} = { config, ... }: ({

home.file = {
".config/xfce4/terminal/accels.scm".text = ''
; xfce4-terminal GtkAccelMap rc-file         -*- scheme -*-
; this file is an automated accelerator map dump
;
; (gtk_accel_path "<Actions>/terminal-window/copy-html" "")
; (gtk_accel_path "<Actions>/terminal-window/new-tab" "<Primary><Shift>t")
; (gtk_accel_path "<Actions>/terminal-window/reset" "")
; (gtk_accel_path "<Actions>/terminal-window/next-tab" "<Primary>Page_Down")
; (gtk_accel_path "<Actions>/terminal-window/search-prev" "")
; (gtk_accel_path "<Actions>/terminal-window/close-tab" "<Primary><Shift>w")
; (gtk_accel_path "<Actions>/terminal-window/help-menu" "")
; (gtk_accel_path "<Actions>/terminal-window/tabs-menu" "")
; (gtk_accel_path "<Actions>/terminal-window/zoom-in-alt" "<Primary>KP_Add")
; (gtk_accel_path "<Actions>/terminal-widget/shift-pagedown" "<Shift>Page_Down")
; (gtk_accel_path "<Actions>/terminal-window/show-toolbar" "")
; (gtk_accel_path "<Actions>/terminal-window/move-tab-right" "<Primary><Shift>Page_Down")
; (gtk_accel_path "<Actions>/terminal-window/zoom-in" "<Primary>plus")
; (gtk_accel_path "<Actions>/terminal-window/fullscreen" "F11")
; (gtk_accel_path "<Actions>/terminal-window/about" "")
; (gtk_accel_path "<Actions>/terminal-window/paste-selection" "")
(gtk_accel_path "<Actions>/terminal-window/paste" "<Primary>v")
; (gtk_accel_path "<Actions>/terminal-widget/shift-down" "<Shift>Down")
; (gtk_accel_path "<Actions>/terminal-window/new-window" "<Primary><Shift>n")
; (gtk_accel_path "<Actions>/terminal-window/edit-menu" "")
; (gtk_accel_path "<Actions>/terminal-window/goto-tab-9" "<Alt>9")
; (gtk_accel_path "<Actions>/terminal-window/reset-and-clear" "")
; (gtk_accel_path "<Actions>/terminal-window/toggle-menubar" "F10")
; (gtk_accel_path "<Actions>/terminal-window/paste-selection-alt" "")
; (gtk_accel_path "<Actions>/terminal-window/set-title-color" "")
; (gtk_accel_path "<Actions>/terminal-window/zoom-reset" "<Primary>0")
; (gtk_accel_path "<Actions>/terminal-window/goto-tab-8" "<Alt>8")
; (gtk_accel_path "<Actions>/terminal-window/detach-tab" "")
(gtk_accel_path "<Actions>/terminal-window/copy" "<Primary>c")
; (gtk_accel_path "<Actions>/terminal-window/show-borders" "")
; (gtk_accel_path "<Actions>/terminal-window/undo-close-tab" "<Primary><Shift>d")
; (gtk_accel_path "<Actions>/terminal-window/open-folder" "")
; (gtk_accel_path "<Actions>/terminal-window/select-all" "<Primary><Shift>a")
; (gtk_accel_path "<Actions>/terminal-window/search-next" "")
; (gtk_accel_path "<Actions>/terminal-window/goto-tab-7" "<Alt>7")
; (gtk_accel_path "<Actions>/terminal-window/show-menubar" "")
; (gtk_accel_path "<Actions>/terminal-window/move-tab-left" "<Primary><Shift>Page_Up")
; (gtk_accel_path "<Actions>/terminal-window/zoom-reset-alt" "<Primary>KP_0")
; (gtk_accel_path "<Actions>/terminal-window/read-only" "")
; (gtk_accel_path "<Actions>/terminal-window/file-menu" "")
; (gtk_accel_path "<Actions>/terminal-window/zoom-out-alt" "<Primary>KP_Subtract")
; (gtk_accel_path "<Actions>/terminal-window/search" "<Primary><Shift>f")
; (gtk_accel_path "<Actions>/terminal-window/goto-tab-6" "<Alt>6")
; (gtk_accel_path "<Actions>/terminal-window/preferences" "")
; (gtk_accel_path "<Actions>/terminal-window/prev-tab" "<Primary>Page_Up")
; (gtk_accel_path "<Actions>/terminal-window/set-title" "<Primary><Shift>s")
; (gtk_accel_path "<Actions>/terminal-window/terminal-menu" "")
; (gtk_accel_path "<Actions>/terminal-window/copy-input" "")
; (gtk_accel_path "<Actions>/terminal-window/goto-tab-5" "<Alt>5")
; (gtk_accel_path "<Actions>/terminal-window/contents" "F1")
; (gtk_accel_path "<Actions>/terminal-window/paste-alt" "<Primary><Shift>Insert")
; (gtk_accel_path "<Actions>/terminal-widget/shift-up" "<Shift>Up")
; (gtk_accel_path "<Actions>/terminal-window/goto-tab-4" "<Alt>4")
; (gtk_accel_path "<Actions>/terminal-window/scroll-on-output" "")
; (gtk_accel_path "<Actions>/terminal-window/zoom-out" "<Primary>minus")
; (gtk_accel_path "<Actions>/terminal-widget/shift-pageup" "<Shift>Page_Up")
; (gtk_accel_path "<Actions>/terminal-window/zoom-menu" "")
; (gtk_accel_path "<Actions>/terminal-window/close-window" "<Primary><Shift>q")
; (gtk_accel_path "<Actions>/terminal-window/goto-tab-3" "<Alt>3")
; (gtk_accel_path "<Actions>/terminal-window/last-active-tab" "")
; (gtk_accel_path "<Actions>/terminal-window/save-contents" "")
; (gtk_accel_path "<Actions>/terminal-window/goto-tab-2" "<Alt>2")
; (gtk_accel_path "<Actions>/terminal-window/close-other-tabs" "")
; (gtk_accel_path "<Actions>/terminal-window/view-menu" "")
; (gtk_accel_path "<Actions>/terminal-window/goto-tab-1" "<Alt>1")
'';
};

gtk.enable = true;
gtk.theme.name = "Adwaita-dark";
# gtk.theme.gtk.package = pkgs.orchis-theme;
gtk.iconTheme.name = "Adwaita-dark";
# gtk.iconTheme.name = "Moradwita";
# gtk.iconTheme.package = pkgs.moradwaita;
# gtk.gtk3.extraConfig.Settings = ''
# gtk-application-prefer-dark-theme = true
# '';
gtk.gtk4.extraConfig.Settings = ''
gtk-application-prefer-dark-theme = true
'';

# add portals

xfconf.enable = true;

xfconf.settings.keyboards = { 
"Default/Numlock" = true; 
};

xfconf.settings.xfce4-notifyd = {
"date-time-custom-format" = "%a %H:%M:%S";
};

xfconf.settings.thunar = {
"last-view" = "ThunarCompactView";
# "misc-show-delete-action" = false;
};

xfconf.settings.xfce4-desktop = {
#   "last/window-width" = 672;
#   "last/window-height" = 547;
# "backdrop/screen0/monitor0/workspace0/last-image" = "/etc/nixos/plants.jpg";
"backdrop/screen0/monitor0/workspace0/last-image" = "/home/user1/Pictures/plants.jpg";
"desktop-icons/style" = 1;
"desktop-icons/show-hidden-files" = false;
"desktop-icons/file-icons/show-filesystem" = false;
"desktop-icons/file-icons/show-trash" = false;
"desktop-icons/file-icons/show-removable" = false;
"desktop-icons/file-icons/show-home" = false;
"desktop-icons/show-thumbnails" = false;
};

xfconf.settings.xfce4-keyboard-shortcuts = {
# "xfwm4/custom/override" = true;
"xfwm4/custom/<Super>Up" = "maximize_window_key";
"xfwm4/custom/<Primary>g" = "hide_window_key";
"xfwm4/custom/<Super>Down" = "tile_down_key";
"xfwm4/custom/<Super>Left" = "tile_left_key";
"xfwm4/custom/<Super>Right" = "tile_right_key";
"xfwm4/custom/<Primary>q" = "close_window_key";

"commands/custom/<Primary>space" = "rofi -show drun";
"commands/custom/<Shift>space" = "xfce4-terminal";
};


xfconf.settings.xfce4-panel = {
"configver" = 2;
"panels/dark-mode" = true;
"panels/panel-1/background-style" = 2;
"panels/panel-1/enter-opacity" = 75;
"panels/panel-1/leave-opacity" = 75;
"panels/panel-1/icon-size" = 16;
"panels/panel-1/length" = 100;
"panels/panel-1/position" = "p=6;x=0;y=0";
"panels/panel-1/position-locked" = true;
"panels/panel-1/size" = 26;
"panels/panel-1/plugin-ids" = [ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 ];

# 1
"plugins/plugin-1" = "applicationsmenu";
"plugins/plugin-1/show-button-title" = false;
"plugins/plugin-1/show-generic-names" = true;
"plugins/plugin-1/show-tooltips" = true;
# "plugins/plugin-1/small" = false;

# 2
"plugins/plugin-2" = "directorymenu";
"plugins/plugin-2/base-directory" = "/home/user1";

# 3
"plugins/plugin-3" = "tasklist";
"plugins/plugin-3/expand" = true;
"plugins/plugin-3/flat-buttons" = false;
"plugins/plugin-3/grouping" = false;
"plugins/plugin-3/show-handle" = false;
"plugins/plugin-3/show-labels" = false;
"plugins/plugin-3/show-tooltips" = true;
"plugins/plugin-3/window-scrolling" = false;
"plugins/plugin-3/style" = 0;

# 4
"plugins/plugin-4" = "separator";
"plugins/plugin-4/expand" = true;
"plugins/plugin-4/style" = 0;

# 5
"plugins/plugin-5" = "separator";
"plugins/plugin-5/expand" = true;
"plugins/plugin-5/style" = 0;

# 6
"plugins/plugin-6" = "clock";
"plugins/plugin-6/digital-layout" = 3;
"plugins/plugin-6/digital-time-format" = "%I:%M %p";
"plugins/plugin-6/digital-date-format" = "%B %d, %Y";

# 7
"plugins/plugin-7" = "separator";
"plugins/plugin-7/expand" = true;
"plugins/plugin-7/style" = 0;

# 8
"plugins/plugin-8" = "separator";
"plugins/plugin-8/expand" = true;
"plugins/plugin-8/style" = 0;

# 9
"plugins/plugin-9" = "systray";
"plugins/plugin-9/icon-size" = 0;
"plugins/plugin-9/square-icons" = true;

# 10
"plugins/plugin-10" = "notification-plugin";

# 11
"plugins/plugin-11" = "separator";
"plugins/plugin-11/style" = 0;
"plugins/plugin-11/expand" = false;

# 12
"plugins/plugin-12" = "pulseaudio";
"plugins/plugin-12/enable-keyboard-shortcuts" = true;

# 13
"plugins/plugin-13" = "separator";
"plugins/plugin-13/style" = 0;
"plugins/plugin-13/expand" = false;


# 14
"plugins/plugin-14" = "actions";
"plugins/plugin-14/style" = 0;

# 15
"plugins/plugin-15" = "separator";
"plugins/plugin-15/style" = 0;
"plugins/plugin-15/expand" = false;

# 16
"plugins/plugin-16" = "power-manager-plugin";


# 17
"plugins/plugin-17" = "separator";
"plugins/plugin-17/style" = 0;
"plugins/plugin-17/expand" = false;

};

xfconf.settings.xfce4-power-manager = {
# "xfce4-power-manager/blank-on-ac" = 30;
# "xfce4-power-manager/blank-on-battery" = 15;
# "xfce4-power-manager/dpms-enabled" = true;
# "xfce4-power-manager/dpms-on-ac-off" = 0;
# "xfce4-power-manager/dpms-on-ac-sleep" = 60;
# "xfce4-power-manager/dpms-on-battery-off" = 0;
# "xfce4-power-manager/dpms-on-battery-sleep" = 35;
};

xfconf.settings.xfce4-terminal = {
  "misc-menubar-default" = false;
  "misc-default-geometry" = "91x35";
  "font-use-system" = false;
  "font-name" = "Monospace 12";
  "misc-show-unsafe-paste-dialog" = false;
  "misc-confirm-close" = false;
  "misc-maximize-default" = false;
  "background-mode" = "TERMINAL_BACKGROUND_TRANSPARENT";
  "background-darkness" = 0.5;
};

xfconf.settings.xfce4-screensaver = {
# "lock/saver-activation/enabled" = false;
# "lock/user-switching/enabled" = false;
# "saver/idle-activation/enabled" = false;
# "saver/mode" = 0;
};

xfconf.settings.xfce4-screenshooter = {
    "imgur-custom-action-added" = false;
};

xfconf.settings.xfce4-session = {
# "general/SaveOnExit" = true;
};

xfconf.settings.xfwm4 = {
  "general/activate_action" = "bring";
  "general/borderless_maximize" = true;
  "general/box_move" = false;
  "general/box_resize" = false;
  "general/button_layout" = "O|SHMC";
  "general/button_offset" = 0;
  "general/button_spacing" = 0;
  "general/click_to_focus" = true;
  "general/cycle_apps_only" = false;
  "general/cycle_draw_frame" = true;
  "general/cycle_raise" = true;
  "general/cycle_hidden" = true;
  "general/cycle_minimum" = true;
  "general/cycle_minimized" = true;
  "general/cycle_preview" = true;
  "general/cycle_tabwin_mode" = 1;
  "general/cycle_workspaces" = true;
  "general/double_click_action" = "maximize";
  "general/double_click_distance" = 5;
  "general/double_click_time" = 250;
  "general/easy_click" = "Alt";
  "general/focus_delay" = 250;
  "general/focus_hint" = true;
  "general/focus_new" = true;
  "general/frame_opacity" = 100;
  "general/frame_border_top" = 0;
  "general/full_width_title" = true;
  "general/horiz_scroll_opacity" = false;
  "general/inactive_opacity" = 100;
  "general/maximized_offset" = 0;
  "general/mousewheel_rollup" = true;
  "general/move_opacity" = 100;
  "general/placement_mode" = "center";
  "general/placement_ratio" = 20;
  "general/popup_opacity" = 100;
  "general/prevent_focus_stealing" = false;
  "general/raise_delay" = 250;
  "general/raise_on_click" = true;
  "general/raise_on_focus" = false;
  "general/raise_with_any_button" = true;
  "general/repeat_urgent_blink" = false;
  "general/resize_opacity" = 100;
  "general/scroll_workspaces" = false;
  "general/shadow_delta_height" = 0;
  "general/shadow_delta_width" = 0;
  "general/shadow_delta_x" = 0;
  "general/shadow_delta_y" = -3;
  "general/shadow_opacity" = 50;
  "general/show_app_icon" = false;
  "general/show_dock_shadow" = true;
  "general/show_frame_shadow" = true;
  "general/show_popup_shadow" = false;
  "general/snap_resist" = false;
  "general/snap_to_border" = true;
  "general/snap_to_windows" = false;
  "general/snap_width" = 10;
  "general/vblank_mode" = "auto";
  "general/theme" = "Default";
  "general/tile_on_move" = true;
  "general/title_alignment" = "center";
  "general/title_font" = "Sans Bold 9";
  "general/title_horizontal_offset" = 0;
  "general/titleless_maximize" = false;
  "general/title_shadow_active" = "false";
  "general/title_shadow_inactive" = "false";
  "general/title_vertical_offset_active" = 0;
  "general/title_vertical_offset_inactive" = 0;
  "general/toggle_workspaces" = false;
  "general/unredirect_overlays" = true;
  "general/urgent_blink" = false;
  "general/use_compositing" = true;
  "general/workspace_count" = 1;
  "general/wrap_cycle" = true;
  "general/wrap_layout" = true;
  "general/wrap_resistance" = 10;
  "general/wrap_windows" = false;
  "general/wrap_workspaces" = false;
  "general/zoom_desktop" = true;
  "general/zoom_pointer" = true;
  "general/workspace_names/0" = "Workspace 1";
};

# xfconf.settings.xsettings = {
#   "Net/ThemeName" = "Adwaita-dark";
#   "Net/IconThemeName" = "MoreWaita";
#   "Net/DoubleClickTime" = "";
#   "Net/DoubleClickDistance" = "";
#   "Net/DndDragThreshold" = "";
#   "Net/CursorBlink" = "";
#   "Net/CursorBlinkTime" = "";
#   "Net/SoundThemeName" = "";
#   "Net/EnableEventSounds" = "";
#   "Net/EnableInputFeedbackSounds" = "";
#   "Xft/DPI" = "";
#   "Xft/Antialias" = "";
#   "Xft/Hinting" = "";
#   "Xft/HintStyle" = "";
#   "Xft/RGBA" = "";
#   "Gtk/CanChangeAccels" = "";
#   "Gtk/ColorPalette" = "";
#   "Gtk/FontName" = "";
#   "Gtk/MonospaceFontName" = "";
#   "Gtk/IconSizes" = "";
#   "Gtk/KeyThemeName" = "";
#   "Gtk/MenuImages" = "";
#   "Gtk/ButtonImages" = "";
#   "Gtk/MenuBarAccel" = "";
#   "Gtk/CursorThemeName" = "";
#   "Gtk/CursorThemeSize" = "";
#   "Gtk/DecorationLayout" = "icon,menu:minimize,maximize,close";
#   "Gtk/DialogsUseHeader" = "";
#   "Gtk/TitlebarMiddleClick" = "";
#   "Gdk/WindowScalingFactor" = "";
# };

});
}
