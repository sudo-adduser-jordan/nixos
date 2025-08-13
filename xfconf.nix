{
xfconf.settings = {
  xfce4-keyboard-shortcuts = {
    "xfwm4/custom/<Super>Up" = "maximize_window_key";
    "xfwm4/custom/<Super>Down" = "tile_down_key";
    "xfwm4/custom/<Super>Right" = "tile_right_key";
    "xfwm4/custom/<Super>Left" = "tile_left_key";
    "backdrop/screen0/monitor0/workspace0/last-image" = "/etc/nixos/plants.jpg";
    # "backdrop/screen0/monitor0/workspace0/last-image" = "/etc/nixos/plants.jpg";
  };

xfce4-panel = {
          "configver" = 2;
          "panels/dark-mode" = true;
          "panels/panel-1/background-style" = 2;
          "panels/panel-1/enter-opacity" = 100;
          "panels/panel-1/icon-size" = 16;
          "panels/panel-1/length" = 100;
          "panels/panel-1/position" = "p=6;x=0;y=0";
          "panels/panel-1/position-locked" = true;
          "panels/panel-1/size" = 26;

          "panels/panel-1/plugin-ids" = [ 1 2 3 4 5 6 7 8 9 ];
          # 1
          "plugins/plugin-1" = "applicationsmenu";
          "plugins/plugin-1/show-button-title" = false;
          "plugins/plugin-1/show-menu-icons" = true;
          # 2
          "plugins/plugin-2" = "tasklist";
          "plugins/plugin-2/flat-buttons" = false;
          "plugins/plugin-2/grouping" = false;
          "plugins/plugin-2/show-handle" = false;
          "plugins/plugin-2/show-labels" = false;
          "plugins/plugin-2/show-tooltips" = true;
          "plugins/plugin-2/window-scrolling" = false;
          # 3
          "plugins/plugin-3" = "separator";
          "plugins/plugin-3/expand" = true;
          "plugins/plugin-3/style" = 0;
          # 4
          "plugins/plugin-4" = "systray";
          "plugins/plugin-4/icon-size" = 0;
          "plugins/plugin-4/square-icons" = true;
          # 5
          "plugins/plugin-5" = "notification-plugin";
          # 6
          "plugins/plugin-6" = "clock";
          "plugins/plugin-6/digital-time-format" = "%I:%M %p";
          "plugins/plugin-6/digital-date-format" = "%B %d, %Y";
          # 7
          "plugins/plugin-7" = "power-manager-plugin";
          # 8
          "plugins/plugin-8" = "pulse-audio";
          "plugins/plugin-8/enable-keyboard-shortcuts" = true;
          # 9
          "plugins/plugin-9" = "separator";
          "plugins/plugin-9/style" = 0;
  };

  xfce4-terminal = {
    "misc-menubar-default" = false;
  };
  
  xfce4-desktop = {
    "desktop-icons/show-thumbnails" = false;
    "desktop-icons/show-hidden-files" = false;
    "desktop-icons/file-icons/show-home" = false;
    "desktop-icons/file-icons/show-removable" = false;
    "desktop-icons/file-icons/show-trash" = false;
    "desktop-icons/file-icons/show-filesystem" = false;
  };
};
}