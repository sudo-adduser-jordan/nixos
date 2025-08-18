{ config, pkgs, specialArgs, ... }:

{
gtk = {
enable = true;

theme.name = "Adwaita-Dark";
# gtk.theme.gtk.package = pkgs.orchis-theme;

iconTheme.name = "Adwaita-Dark";
# gtk.iconTheme.name = "Moradwita";
# gtk.iconTheme.package = pkgs.moradwaita;

gtk3.extraConfig.Settings = ''
gtk-application-prefer-dark-theme=1
'';

gtk4.extraConfig.Settings = ''
gtk-application-prefer-dark-theme=1
'';

};
}