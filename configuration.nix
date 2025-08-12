{ config, pkgs, ... }:
{
imports = [ 
  /nix/store/f70x7zvdiapka39q397i00cp3cal1hbx-home-manager-25.05.tar.gz/home-manager/nixos
  ./hardware-configuration.nix 
];

# boot
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;
boot.kernelPackages = pkgs.linuxPackages_latest;

# networking
networking.hostName = "nixos"; 
networking.networkmanager.enable = true;
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

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

services.xserver.enable = true;
services.xserver.displayManager.lightdm.enable = true;
services.xserver.desktopManager.xfce.enable = true;
services.xserver.xkb = {
  layout = "us";
  variant = "";
};

services.printing.enable = true;

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
};
  
# home
home-manager.users.user1 = { pkgs, ... }: {
imports = [ 
  ./xfconf.nix
  ./rofi.nix
  ./vscode.nix
  ./gtk.nix
];
nixpkgs.config.allowUnfree = true;
home.packages = with pkgs; 
[ 
vscode
rofi
];
home.stateVersion = "25.05"; 
};

# system
nixpkgs.config.allowUnfree = true;
environment.systemPackages = with pkgs; 
[
fastfetch
librewolf
flatpak
github-desktop
git
gh 
discord
bash
zsh
google-chrome
xdg-utils
xdg-desktop-portal
xdg-desktop-portal-gtk
gnome-keyring
seahorse
libreoffice
# nixos-artwork
# qjournalctl
kdePackages.ksystemlog
];

# aliases
environment.shellAliases = {
  update = "sudo nixos-rebuild switch";
  codenix= "sudo code /etc/nixos/ --user-data-dir='.' --no-sandbox";
};

# portals
xdg.portal.enable = true;
xdg.autostart.enable = true;
xdg.portal.xdgOpenUsePortal = true;
xdg.portal.extraPortals = [
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
];

system.stateVersion = "25.05"; 
}
