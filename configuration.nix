{ config, pkgs, ... }:

let
  user = "user1";
  hostName = "computer1";
in

{

imports = [ 
  ./hardware-configuration.nix 
];

# boot
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;
boot.kernelPackages = pkgs.linuxPackages_latest;

# networking
networking.hostName = hostName; 
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
  description = "descripton of user";
  extraGroups = [ "networkmanager" "wheel" ];
};

system.activationScripts.copyConfig = {
text = ''

echo 
echo ln -sf /etc/nixos/.gitignore /home/${user}/.gitignore

echo rm -rf /home/user1/.config/Code
echo rm -rf /home/user1/.config/fastfetch
echo rm -rf /home/user1/.config/gtk-3.0
echo rm -rf /home/user1/.config/gtk-4.0
echo rm -rf /home/user1/.config/Mousepad
echo rm -rf /home/user1/.config/rofi
echo rm -rf /home/user1/.config/Thunar
echo rm -rf /home/user1/.config/xfce4
echo rm -rf /home/user1/.vscode/extensions

echo ln -sf /etc/nixos/.config/* /home/${user}/.config
echo ln -sf /etc/nixos/.vscode/* /home/${user}/.vscode
echo ln -sf /etc/nixos/Pictures/* /home/${user}/Pictures
echo 


'';
};


# system
nixpkgs.config.allowUnfree = true;
environment.systemPackages = with pkgs; 
[

# config
fastfetch
vscode
rofi

# no config
librewolf
flatpak
github-desktop
gh 
git
discord
bash
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

system.stateVersion = "25.05"; 
}
