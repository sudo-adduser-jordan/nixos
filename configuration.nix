{ config, pkgs, ... }:
{
imports = [ 
  ./hardware-configuration.nix 
];

# boot
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;
boot.kernelPackages = pkgs.linuxPackages_latest;

# networking
networking.hostName = "computer1"; 
networking.networkmanager.enable = true;

# local
time.timeZone = "America/Los_Angeles";
i18n.defaultLocale = "en_US.UTF-8";
i18n.extraLocaleSettings = {
  LC_ADDRESS = "en_US.UTF-8";
  LC_IDENTIFICATION = "en_US.UTF-8";
  LC_MEASUREMENT = "en_US.UTF-8";
  LC_MONETARY = "en_US.UTF-8";
  LC_NAME = "en_US.UTF-8";
  LC_NUMERIC = "en_US.UTF-8";
  LC_PAPER = "en_US.UTF-8";
  LC_TELEPHONE = "en_US.UTF-8";
  LC_TIME = "en_US.UTF-8";
};

# services
services.flatpak.enable = true;
services.gnome.gnome-keyring.enable = true;
# security.pam.services.login.enableGnomeKeyring = true;

# desktop environment
services.xserver.enable = true;
services.xserver.displayManager.lightdm.enable = true;
services.xserver.desktopManager.xfce.enable = true;
services.xserver.xkb = {
  layout = "us";
  variant = "";
};
services.printing.enable = true;

# sound
services.pulseaudio.enable = false;
security.rtkit.enable = true;
services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
};

# users
users.users.user1 = {
  isNormalUser = true;
  description = "user1";
  extraGroups = [ "networkmanager" "wheel" ];
  # import configurations because home manager is a stupid waste of time manualy reformatting configs
  # maybe theres a way to dump in format but still its extra steps guys cmon you dont need to rewrite everything
  system.activationScripts.copyConfig = {
  text = ''
    cp -r /etc/nixos/.config /home/${user1}/.config
    cp -r /etc/nixos/.vscode /home/${user1}/.vscode
    cp -r /etc/nixos/Pictures /home/${user1}/Pictures
    chown -R ${user1}:${user1} /home/${user1}/.config 
    chown -R ${user1}:${user1} /home/${user1}/.vscode 
    chown -R ${user1}:${user1} /home/${user1}/Pictures 
  '';
  # deps = [];
};

# home
nixpkgs.config.allowUnfree = true;
packages = with pkgs; 
[ 
fastfetch
vscode
rofi
];
};

# system
nixpkgs.config.allowUnfree = true;
environment.systemPackages = with pkgs; 
[

librewolf
flatpak
github-desktop
git
gh 
discord
bash
# zsh
google-chrome
xdg-utils
xdg-desktop-portal
xdg-desktop-portal-gtk
gnome-keyring
seahorse
libreoffice
kdePackages.ksystemlog
# stacer

];

# aliases
environment.shellAliases = {
  clean = "nix-collect-garbage";
  update = "nixos-rebuild switch --upgrade";
  rollback = "nixos-rebuild switch --rollback";
  channel-list = "nix-channel --list";
  channel-update = "nix-channel --update";
  # codenix= "sudo code /etc/nixos/ --user-data-dir='.' --no-sandbox";
};

# portals
xdg.portal.enable = true;
xdg.autostart.enable = true;
xdg.portal.xdgOpenUsePortal = true;
xdg.portal.extraPortals = [
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
];

# gtk theme
gtk.enable = true;
gtk.theme = {
     name = "Adwaita-dark";
    # package = location;
};
gtk.iconTheme = {
    name = "Adwaita";
    # package = location;
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

system.stateVersion = "25.05"; 
}
