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

}