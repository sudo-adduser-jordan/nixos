{ config, pkgs, specialArgs, ... }:
{


  home-manager.users.${specialArgs.user} = { config, ... }: ({
    programs.rofi = {
      enable = true; 
      theme = "Arc-Dark"; 
      modes = [ "drun" ]; 
      extraConfig = {
        "show-icons" = true;
      	"kb-cancel" = "Escape,Control+g,Control+q,Alt+Tab";
      }; 
    };

  });

  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];

  users.users.${specialArgs.user}.packages = with pkgs; [
  ];

  xdg.portal = {
  };

}