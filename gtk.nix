{
gtk.enable = true;
gtk.theme = {
     name = "Adwaita-dark";
};
gtk.iconTheme = {
    name = "Adwaita";
    # package = winx11;
};
gtk.gtk3.extraConfig = {
    Settings = ''
      gtk-application-prefer-dark-theme=1
    '';
};
gtk.gtk4.extraConfig = {
    Settings = ''
      gtk-application-prefer-dark-theme=1
    '';
};
}