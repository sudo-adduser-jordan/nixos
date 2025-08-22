{ config, pkgs, specialArgs, ... }:

{
gtk.enable = true;

gtk.theme.name = "Adwaita-dark";
# gtk.theme.gtk.package = pkgs.orchis-theme;

gtk.iconTheme.name = "Adwaita-dark";
# gtk.iconTheme.name = "";
# gtk.iconTheme.package = pkgs.;

# gtk.gtk3.extraConfig.Settings = ''
# gtk-application-prefer-dark-theme = true
# '';
gtk.gtk4.extraConfig.Settings = ''
gtk-application-prefer-dark-theme = true
'';

}