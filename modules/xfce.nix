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
xfce.xfce4-weather-plugin
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
# "backdrop/screen0/monitor0/workspace0/color-style" = 0;
# "backdrop/screen0/monitor0/workspace0/image-style" = 5;
# "backdrop/screen0/monitor0/workspace0/last-image" = background-image;
# "backdrop/screen0/monitor0/workspace1/color-style" = 0;
# "backdrop/screen0/monitor0/workspace1/image-style" = 5;
# "backdrop/screen0/monitor0/workspace1/last-image" = background-image;
# "backdrop/screen0/monitorDP-1/workspace0/color-style" = 0;
# "backdrop/screen0/monitorDP-1/workspace0/image-style" = 5;
# "backdrop/screen0/monitorDP-1/workspace0/last-image" = background-image;
# "backdrop/screen0/monitorDP-1/workspace1/color-style" = 0;
# "backdrop/screen0/monitorDP-1/workspace1/image-style" = 5;
# "backdrop/screen0/monitorDP-1/workspace1/last-image" = background-image;
# "backdrop/screen0/monitorDP-2/workspace0/color-style" = 0;
# "backdrop/screen0/monitorDP-2/workspace0/image-style" = 5;
# "backdrop/screen0/monitorDP-2/workspace0/last-image" = background-image;
# "backdrop/screen0/monitorDP-2/workspace1/color-style" = 0;
# "backdrop/screen0/monitorDP-2/workspace1/image-style" = 5;
# "backdrop/screen0/monitorDP-2/workspace1/last-image" = background-image;
# "desktop-icons/show-thumbnails" = false;
# "desktop-icons/style" = 0;
# "windowlist-menu/show" = false;
};

# "backdrop/screen0/monitor0/workspace0/last-image" = "/etc/nixos/plants.jpg";
xfconf.settings.xfce4-keyboard-shortcuts = {
"xfwm4/custom/<Super>Up" = "maximize_window_key";
"xfwm4/custom/<Super>Down" = "tile_down_key";
"xfwm4/custom/<Super>Right" = "tile_right_key";
"xfwm4/custom/<Super>Left" = "tile_left_key";
# "commands/custom/<Super>space" = "rofi -show drun";
};

xfconf.settings.xfce4-panel = {
# "configver" = 2;
# "panels/dark-mode" = true;
# "panels/panel-1/background-style" = 2;
# "panels/panel-1/enter-opacity" = 100;
# "panels/panel-1/icon-size" = 16;
# "panels/panel-1/length" = 100;
# "panels/panel-1/plugin-ids" = [1 2 3 4 5 6 7 8 9 10 11 12 13];
# "panels/panel-1/position" = "p=6;x=0;y=0";
# "panels/panel-1/position-locked" = true;
# "panels/panel-1/size" = 26;
# "plugins/plugin-1" = "tasklist";
# "plugins/plugin-1/flat-buttons" = false;
# "plugins/plugin-1/grouping" = false;
# "plugins/plugin-1/show-handle" = false;
# "plugins/plugin-1/show-labels" = true;
# "plugins/plugin-1/show-tooltips" = false;
# "plugins/plugin-1/window-scrolling" = false;
# "plugins/plugin-2" = "separator";
# "plugins/plugin-2/expand" = true;
# "plugins/plugin-2/style" = 0;
# "plugins/plugin-3" = "netload";
# "plugins/plugin-4" = "genmon";
# "plugins/plugin-4/command" = "freemem";
# "plugins/plugin-4/enable-single-row" = true;
# "plugins/plugin-4/font" = "Sans 10";
# "plugins/plugin-4/style" = 0;
# "plugins/plugin-4/text" = "free memory";
# "plugins/plugin-4/update-period" = 30000;
# "plugins/plugin-4/use-label" = false;
# "plugins/plugin-5" = "pager";
# "plugins/plugin-5/rows" = 1;
# "plugins/plugin-6" = "weather";
# "plugins/plugin-6/cache-max-age" = 172800;
# "plugins/plugin-6/forecast/days" = 5;
# "plugins/plugin-6/forecast/layout" = 1;
# "plugins/plugin-6/labels/label0" = 3;
# "plugins/plugin-6/location/latitude" = "30.000";
# "plugins/plugin-6/location/longitude" = "-30.000";
# "plugins/plugin-6/location/name" = "My Secret Location";
# "plugins/plugin-6/msl" = 57;
# "plugins/plugin-6/offset" = "-04:00";
# "plugins/plugin-6/power-saving" = true;
# "plugins/plugin-6/round" = true;
# "plugins/plugin-6/scrollbox/animate" = "2";
# "plugins/plugin-6/scrollbox/color" = "rgba(0,0,0,0)";
# "plugins/plugin-6/scrollbox/lines" = 1;
# "plugins/plugin-6/scrollbox/show" = true;
# "plugins/plugin-6/scrollbox/use-color" = false;
# "plugins/plugin-6/single-row" = true;
# "plugins/plugin-6/timezone" = "American/New_York";
# "plugins/plugin-6/tooltip-style" = 1;
# "plugins/plugin-6/units/altitude" = 1;
# "plugins/plugin-6/units/apparent-temperature" = 0;
# "plugins/plugin-6/units/precipitation" = 1;
# "plugins/plugin-6/units/pressure" = 0;
# "plugins/plugin-6/units/temperature" = 1;
# "plugins/plugin-6/units/windspeed" = 1;
# "plugins/plugin-7" = "pulseaudio";
# "plugins/plugin-7/enable-keyboard-shortcuts" = true;
# "plugins/plugin-8" = "power-manager-plugin";
# "plugins/plugin-9" = "systray";
# "plugins/plugin-9/square-items" = true;
# "plugins/plugin-10" = "notification-plugin";
# "plugins/plugin-11" = "clock";
# "plugins/plugin-11/digital-date-font" = "Sans Bold 10";
# "plugins/plugin-11/digital-layout" = 3;
# "plugins/plugin-11/digital-time-font" = "Sans Bold 10";
# "plugins/plugin-11/digital-time-format" = "%a %d %R";
# "plugins/plugin-11/timezone" = "UTC";
# "plugins/plugin-12" = "clock";
# "plugins/plugin-12/digital-date-font" = "Sans Bold 10";
# "plugins/plugin-12/digital-layout" = 3;
# "plugins/plugin-12/digital-time-font" = "Sans Bold 10";
# "plugins/plugin-12/digital-time-format" = " %R";
# "plugins/plugin-12/mode" = 2;
# "plugins/plugin-12/tooltip-format" = "%x";
# "plugins/plugin-13" = "separator";
# "plugins/plugin-13/style" = 0;
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
# "general/button_layout" = "O|HMC"; # titlebar minimize/maximize/close
# "general/focus_delay" = 0;
# "general/mousewheel_rollup" = false;
# "general/move_opacity" = 100;
# "general/raise_delay" = 0;
# "general/title_font" = "Sans Bold 9";
# "general/use_compositing" = true;
# "general/wrap_cycle" = true;
# "general/wrap_windows" = true;
# "general/wrap_workspaces" = false;
# "general/workspace_count" = 2;
# "general/workspace_names" = [ "1" "2" ];
};

xfconf.settings.xsettings = {
# "Gdk/WindowScalingFactor" = 1;
# "Gtk/ButtonImages" = false;
# "Gtk/CanChangeAccels" = false;
# "Gtk/ColorPalette" = "black:white:gray50:red:purple:blue:light blue:green:yellow:orange:lavender:brown:goldenrod4:dodger blue:pink:light green:gray10:gray30:gray75:gray90";
# "Gtk/CursorThemeName" = "Vanilla-DMZ";
# "Gtk/CursorThemeSize" = 16;
# "Gtk/DecorationLayout" = "menu:minimize,maximize,close";
# "Gtk/DialogsUseHeader" = false;
# "Gtk/FontName" = "Sans 10";
# "Gtk/MenuImages" = "1";
# "Gtk/MonospaceFontName" = "Monospace 10";
# "Gtk/TitlebarMiddleClick" = "lower";
# "Gtk/ToolbarIconSize" = 3;
# "Gtk/ToolbarStyle" = "icons";
# "Net/CursorBlink" = true;
# "Net/CursorBlinkTime" = 1200;
# "Net/DndDragThreshold" = 8;
# "Net/DoubleClickDistance" = 5;
# "Net/DoubleClickTime" = 400;
# "Net/EnableEventSounds" = false;
# "Net/EnableInputFeedbackSounds" = false;
# "Net/IconThemeName" = "Paper";
# "Net/ThemeName" = "Orchis-Orange-Dark-Compact";
};

});
}
