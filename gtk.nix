{
gtk = {
  enable = true;
  theme = {
     name = "Adwaita-dark";
  };
  iconTheme = {
    name = "Adwaita";
    # package = winx11;
  };
  gtk3.extraConfig = {
    Settings = ''
      gtk-application-prefer-dark-theme=1
    '';
  };
  gtk4.extraConfig = {
    Settings = ''
      gtk-application-prefer-dark-theme=1
    '';
  };
};
}