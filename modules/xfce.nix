{ config, pkgs, specialArgs, ... }:

let background-image = "${pkgs.xfce.xfdesktop}/share/backgrounds/xfce/xfce-leaves.svg";

in 
{ # xfce

services.xserver = {
enable = true;

desktopManager.xfce.enable = true;
# desktopManager.xfce.noDesktop = false;
# desktopManager.xfce.enableXfwm = true;

displayManager.startx.enable = true;
displayManager.lightdm.enable = true;
# displayManager.lightdm.extraConfig = ''
# background = ${background-image}
# '';
# displayManager.lightdm.greeters.gtk.extraConfig = ''
# background = ${background-image}
# '';

xkb.layout = "us";
xkb.variant = "";

exportConfiguration = true;
excludePackages = with pkgs; [
# xterm
];

};

# system
environment.systemPackages = with pkgs; [

# Shell, window manager and x11 packages need to be installed at the
# system level or else you will experience quirks with nixOS 24.05.
# wmctrl # workspace switcher used by /usr/bin/switch-workspace
xclip
xfce.mousepad
xfce.thunar-archive-plugin
xfce.thunar-volman
xfce.xfce4-genmon-plugin
xfce.xfce4-netload-plugin
xfce.xfce4-power-manager
xfce.xfce4-pulseaudio-plugin
# xfce.xfce4-weather-plugin
xfce.xfwm4-themes
xorg.xinit

];

environment.xfce.excludePackages = with pkgs; [
# xfce.xfce4-appfinder
# xfce.xfce4-taskmanager
# xfce.xfce4-terminal
];

programs.thunar.plugins = with pkgs.xfce; [
thunar-archive-plugin
thunar-volman
];


# home
users.users.${specialArgs.user}.packages = with pkgs; [
# file-roller
# orchis-theme     # gtk theme
# paper-icon-theme # xfce icons
# redshift         # blue light screen filter
# vanilla-dmz      # cursor set by home-manager
];

home-manager.users.${specialArgs.user} = { config, ... }: ({

home.pointerCursor = {
    name = "Vanilla-DMZ";
    package = pkgs.vanilla-dmz;
    size = 64;
    x11.enable = true;
};
home.file.".config/xfce4/helpers.rc".text = "TerminalEmulator=alacritty";
home.file = {
".config/xfce4/desktop/accels.scm".text = ''
; xfdesktop GtkAccelMap rc-file         -*- scheme -*-
; this file is an automated accelerator map dump
;
; (gtk_accel_path "<Actions>/XfceDesktop/primary-menu-2" "Menu")
; (gtk_accel_path "<Actions>/XfdesktopFileIconManager/open-with-other" "")
; (gtk_accel_path "<Actions>/XfdesktopIconView/activate-3" "Return")
; (gtk_accel_path "<Actions>/XfdesktopFileIconManager/properties-3" "<Alt>KP_Enter")
; (gtk_accel_path "<Actions>/XfdesktopFileIconManager/trash" "Delete")
; (gtk_accel_path "<Actions>/XfceDesktop/next-background" "")
; (gtk_accel_path "<Actions>/XfdesktopFileIconManager/cut-2" "")
; (gtk_accel_path "<Actions>/XfdesktopFileIconManager/cut" "<Primary>x")
; (gtk_accel_path "<Actions>/XfdesktopIconView/unselect-all" "Escape")
; (gtk_accel_path "<Actions>/XfdesktopFileIconManager/copy-2" "<Primary>Insert")
; (gtk_accel_path "<Actions>/XfdesktopIconView/activate" "space")
; (gtk_accel_path "<Actions>/XfdesktopIconView/activate-2" "KP_Space")
; (gtk_accel_path "<Actions>/XfdesktopFileIconManager/open" "<Primary>o")
; (gtk_accel_path "<Actions>/XfdesktopIconView/select-all" "<Primary>a")
; (gtk_accel_path "<Actions>/XfdesktopFileIconManager/properties-2" "<Alt>ISO_Enter")
; (gtk_accel_path "<Actions>/XfdesktopFileIconManager/empty-trash" "")
; (gtk_accel_path "<Actions>/XfdesktopFileIconManager/open-trash" "")
; (gtk_accel_path "<Actions>/XfdesktopFileIconManager/trash-3" "")
; (gtk_accel_path "<Actions>/XfdesktopFileIconManager/properties" "<Alt>Return")
; (gtk_accel_path "<Actions>/XfdesktopFileIconManager/copy" "<Primary>c")
; (gtk_accel_path "<Actions>/XfceDesktop/reload-2" "Reload")
; (gtk_accel_path "<Actions>/XfdesktopFileIconManager/delete-3" "")
; (gtk_accel_path "<Actions>/XfdesktopFileIconManager/trash-2" "KP_Delete")
; (gtk_accel_path "<Actions>/XfceDesktop/reload" "<Primary>r")
; (gtk_accel_path "<Actions>/XfdesktopFileIconManager/paste-into-folder" "")
; (gtk_accel_path "<Actions>/XfdesktopFileIconManager/paste-2" "<Shift>Insert")
; (gtk_accel_path "<Actions>/XfceDesktop/secondary-menu" "<Primary><Shift>F10")
; (gtk_accel_path "<Actions>/XfdesktopFileIconManager/delete-2" "<Shift>KP_Delete")
; (gtk_accel_path "<Actions>/XfdesktopIconView/toggle-cursor-2" "<Primary>KP_Space")
; (gtk_accel_path "<Actions>/XfceDesktop/reload-1" "F5")
; (gtk_accel_path "<Actions>/XfdesktopFileIconManager/open-filesystem" "")
; (gtk_accel_path "<Actions>/XfdesktopIconView/activate-5" "KP_Enter")
; (gtk_accel_path "<Actions>/XfceDesktop/primary-menu" "<Shift>F10")
; (gtk_accel_path "<Actions>/XfdesktopFileIconManager/create-document" "")
; (gtk_accel_path "<Actions>/XfdesktopFileIconManager/create-folder" "<Primary><Shift>n")
; (gtk_accel_path "<Actions>/XfdesktopIconView/toggle-cursor" "<Primary>space")
; (gtk_accel_path "<Actions>/XfdesktopFileIconManager/toggle-show-hidden" "<Primary>h")
; (gtk_accel_path "<Actions>/XfdesktopFileIconManager/open-home" "<Alt>Home")
; (gtk_accel_path "<Actions>/XfdesktopIconView/activate-4" "ISO_Enter")
; (gtk_accel_path "<Actions>/XfdesktopFileIconManager/delete" "<Shift>Delete")
; (gtk_accel_path "<Actions>/XfdesktopFileIconManager/paste" "<Primary>v")
; (gtk_accel_path "<Actions>/XfdesktopFileIconManager/rename" "F2")
; (gtk_accel_path "<Actions>/XfdesktopIconView/arrange-icons" "")
; (gtk_accel_path "<Actions>/XfceDesktop/secondary-menu-2" "<Primary>Menu")
'';

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
# https://github.com/catppuccin/xfce4-terminal
 ".local/share/xfce4/terminal/colorschemes/catppuccin-mocha.theme".text = ''
      [Scheme]
      Name=Catppuccin-Mocha
      ColorCursor=#f5e0dc
      ColorCursorForeground=#11111b
      ColorCursorUseDefault=FALSE
      ColorForeground=#cdd6f4
      ColorBackground=#1e1e2e
      ColorSelectionBackground=#585b70
      ColorSelection=#cdd6f4
      ColorSelectionUseDefault=FALSE
      TabActivityColor=#fab387
      ColorPalette=#45475a;#f38ba8;#a6e3a1;#f9e2af;#89b4fa;#f5c2e7;#94e2d5;#bac2de;#585b70;#f38ba8;#a6e3a1;#f9e2af;#89b4fa;#f5c2e7;#94e2d5;#a6adc8
'';
};





gtk = {
enable = true;

theme.name = "Adwaita-dark";
# gtk.theme.gtk.package = pkgs.orchis-theme;

iconTheme.name = "Adwaita-dark";
# gtk.iconTheme.name = "Moradwita";
# gtk.iconTheme.package = pkgs.moradwaita;

# gtk3.extraConfig.Settings = ''
# gtk-application-prefer-dark-theme = true
# '';

gtk4.extraConfig.Settings = ''
gtk-application-prefer-dark-theme = true
'';

};

xdg.portal = {
enable = true;
extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
};
    
# xdg.userDirs = {
#     enable = true;
#     createDirectories = false;
#     desktop = "${config.home.homeDirectory}/desktop";
#     documents = "${config.home.homeDirectory}/documents";
#     download = "${config.home.homeDirectory}/downloads";
#     music = "${config.home.homeDirectory}/music";
#     pictures = "${config.home.homeDirectory}/pictures";
#     publicShare = "${config.home.homeDirectory}/public";
#     templates = "${config.home.homeDirectory}/templates";
#     videos = "${config.home.homeDirectory}/videos";
# };

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
# "backdrop/screen0/monitor0/workspace0/last-image" = "/etc/nixos/plants.jpg";
#   "last/window-width" = 672;
#   "last/window-height" = 547;
  "backdrop/screen0/monitorDP-1/workspace0/last-image" = "/home/user1/Pictures/plants.jpg";
  "desktop-icons/style" = 2;
  "desktop-icons/show-hidden-files" = false;
  "file-icons/show-filesystem" = false;
  "file-icons/show-trash" = false;
  "file-icons/show-removable" = false;
  "file-icons/show-home" = false;
  "desktop-icons/show-thumbnails" = false;
};

xfconf.settings.xfce4-keyboard-shortcuts = {
"xfwm4/custom/<Super>Up" = "maximize_window_key";
"xfwm4/custom/<Super>Down" = "tile_down_key";
"xfwm4/custom/<Super>Right" = "tile_right_key";
"xfwm4/custom/<Super>Left" = "tile_left_key";
# "commands/custom/<Super>space" = "rofi -show drun";
};

xfconf.settings.xfce4-panel = {
"panels/0/dark-mode" = true;
"panels/0/panel-1/position" = "p=6;x=0;y=0";
"panels/0/panel-1/size" = 26;
"panels/0/panel-1/background-style" = 1;
"panels/0/panel-1/enter-opacity" = 75;
"panels/0/panel-1/icon-size" = 0;
"panels/0/panel-1/length" = 100;
"panels/0/panel-1/plugin-ids/0" = 15;
"panels/0/panel-1/plugin-ids/1" = 11;
"panels/0/panel-1/plugin-ids/2" = 2;
"panels/0/panel-1/plugin-ids/3" = 3;
"panels/0/panel-1/plugin-ids/4" = 4;
"panels/0/panel-1/plugin-ids/5" = 5;
"panels/0/panel-1/plugin-ids/6" = 6;
"panels/0/panel-1/plugin-ids/7" = 7;
"panels/0/panel-1/plugin-ids/8" = 8;
"panels/0/panel-1/plugin-ids/9" = 9;
"panels/0/panel-1/plugin-ids/10" = 10;
"panels/0/panel-1/plugin-ids/11" = 12;
"panels/0/panel-1/plugin-ids/12" = 13;
"panels/0/panel-1/position-locked" = true;
"panels/0/panel-1/leave-opacity" = 75;
"plugins/plugin-2/grouping" = false;
"plugins/plugin-2/expand" = true;
"plugins/plugin-2/style" = 0;
"plugins/plugin-2/flat-buttons" = false;
"plugins/plugin-2/show-handle" = false;
"plugins/plugin-2/show-labels" = false;
"plugins/plugin-2/show-tooltips" = true;
"plugins/plugin-2/window-scrolling" = false;
"plugins/plugin-5/style" = 0;
"plugins/plugin-5/rows" = 1;
"plugins/plugin-5/expand" = true;
"plugins/plugin-7/style" = 0;
"plugins/plugin-7/enable-keyboard-shortcuts" = true;
"plugins/plugin-7/digital-date-font" = "Sans Bold 10";
"plugins/plugin-7/digital-layout" = 3;
"plugins/plugin-7/digital-time-font" = "Sans Bold 10";
"plugins/plugin-7/digital-time-format" = "%a %d %R";
"plugins/plugin-7/timezone" = "UTC";
"plugins/plugin-4/show-button-title" = false;
"plugins/plugin-4/show-menu-icons" = true;
"plugins/plugin-4/icon-size" = 0;
"plugins/plugin-4/single-row" = false;
"plugins/plugin-4/hide-new-items" = false;
"plugins/plugin-4/square-icons" = true;
"plugins/plugin-4/digital-date-format" = "%B %d, %Y";
"plugins/plugin-4/digital-time-format" = "%I:%M %p";
"plugins/plugin-4/mode" = 2;
"plugins/plugin-4/timezone" = "America/Los_Angeles";
"plugins/plugin-3/expand" = true;
"plugins/plugin-3/style" = 0;
"plugins/plugin-6/digital-date-font" = "Monospace 10";
"plugins/plugin-6/digital-layout" = 3;
"plugins/plugin-6/digital-time-font" = "Monospace 10";
"plugins/plugin-6/digital-time-format" = "%I:%M %p";
"plugins/plugin-6/timezone" = "America/Los_Angeles";
"plugins/plugin-6/mode" = 2;
"plugins/plugin-6/show-week-numbers" = true;
"plugins/plugin-6/digital-date-format" = "%B %d, %Y";
"plugins/plugin-6/icon-size" = 0;
"plugins/plugin-6/square-icons" = true;
"plugins/plugin-9/enabled-keyboard-shortcuts" = true;
"plugins/plugin-9/style" = 0;
"plugins/plugin-8/enable-keyboard-shortcuts" = true;
"plugins/plugin-10/style" = 0;
"plugins/plugin-11/style" = 2;
"plugins/plugin-12" = "actions";
"plugins/plugin-13/style" = 0;
"plugins/plugin-13/expand" = false;
"plugins/plugin-15/launcher-show-name" = true;
"plugins/plugin-15/menu-height" = 10000;
"plugins/plugin-15/menu-width" = 10000;
"plugins/plugin-15/view-mode" = 0;
"plugins/plugin-15/position-categories-horizontal" = false;
"plugins/plugin-15/position-categories-alternate" = true;
"plugins/plugin-15/position-profile-alternate" = false;
"plugins/plugin-15/profile-shape" = 2;
"plugins/plugin-15/default-category" = 2;
"plugins/plugin-15/recent/0" = "nixos-manual.desktop";
"plugins/plugin-15/button-single-row" = true;
"plugins/plugin-15/position-commands-alternate" = true;
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
# "imgur-custom-action-added" = false;
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

xfconf.settings.xsettings = {
  "Net/ThemeName" = "Adwaita-dark";
  "Net/IconThemeName" = "MoreWaita";
  "Net/DoubleClickTime" = "";
  "Net/DoubleClickDistance" = "";
  "Net/DndDragThreshold" = "";
  "Net/CursorBlink" = "";
  "Net/CursorBlinkTime" = "";
  "Net/SoundThemeName" = "";
  "Net/EnableEventSounds" = "";
  "Net/EnableInputFeedbackSounds" = "";
  "Xft/DPI" = "";
  "Xft/Antialias" = "";
  "Xft/Hinting" = "";
  "Xft/HintStyle" = "";
  "Xft/RGBA" = "";
  "Gtk/CanChangeAccels" = "";
  "Gtk/ColorPalette" = "";
  "Gtk/FontName" = "";
  "Gtk/MonospaceFontName" = "";
  "Gtk/IconSizes" = "";
  "Gtk/KeyThemeName" = "";
  "Gtk/MenuImages" = "";
  "Gtk/ButtonImages" = "";
  "Gtk/MenuBarAccel" = "";
  "Gtk/CursorThemeName" = "";
  "Gtk/CursorThemeSize" = "";
  "Gtk/DecorationLayout" = "icon,menu:minimize,maximize,close";
  "Gtk/DialogsUseHeader" = "";
  "Gtk/TitlebarMiddleClick" = "";
  "Gdk/WindowScalingFactor" = "";
};

});
}
