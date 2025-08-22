{ config, pkgs, specialArgs, inputs, ... }:

{ system.stateVersion = specialArgs.version; 

nix.settings.experimental-features = [ "nix-command" "flakes" ];

imports = [ # system
    ./hardware-configuration.nix
    ./modules/xfce.nix
];

boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;

networking.hostName = "computer1";
networking.networkmanager.enable = true;

time.timeZone = specialArgs.timezone;
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

# services.pulseaudio.enable = false;
security.rtkit.enable = true;
services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
};

home-manager.useGlobalPkgs = true;
home-manager.backupFileExtension = ".bak";

# user
home-manager.users.${specialArgs.user} = {  
    home.stateVersion = specialArgs.version;
    home.file = { "Pictures" = { source = ./Pictures; recursive = true; }; }; 
    imports = [ 
./modules/gtk.nix
./modules/rofi.nix
./modules/fastfetch.nix
./modules/vscode.nix
./modules/mousepad.nix
];};

users.users.${specialArgs.user} = {
    isNormalUser = true;
    description = specialArgs.user;
    extraGroups = [ "networkmanager" "wheel" ];
 };

# root
home-manager.users.root = {
    home.stateVersion = specialArgs.version;
    home.file = { "Pictures" = { source = ./Pictures; recursive = true; }; }; 
    imports =[ 
./modules/gtk.nix
./modules/rofi.nix
./modules/fastfetch.nix
./modules/vscode.nix
./modules/mousepad.nix
];};

environment.systemPackages = with pkgs; [
rofi
vscode
fastfetch

gh
git
github-desktop

pnpm
nodejs_22

discord
librewolf
google-chrome

libreoffice

seahorse
gnome-keyring

systemdgenie
kdePackages.ksystemlog
kdePackages.spectacle

xfce.xfce4-whiskermenu-plugin

flatpak
xdg-utils
xdg-desktop-portal
xdg-desktop-portal-gtk
xdg-desktop-portal-xapp

icon-library
# nixos-icons

theme-obsidian2
adwaita-icon-theme
morewaita-icon-theme # use this

nerd-fonts.adwaita-mono
nerd-fonts.jetbrains-mono
];

fonts.packages = with pkgs; [
adwaita-fonts
font-awesome
font-awesome_4
font-awesome_5
nerd-fonts.adwaita-mono
];

environment.variables = {
};

environment.shellAliases = {
    codenix = "code ~/nixos";
    clean = "nix-collect-garbage";
    channels = "nix-channel --list";
    channels-update = "nix-channel --update";
    rollback = "nixos-rebuild switch --rollback";
    generations-delete = "nix-env --delete-generations";
    generations = "nix-env -p /nix/var/nix/profiles/system --list-generations";
    switch = "nixos-rebuild switch --flake /home/${specialArgs.user}/nixos/.";
};

services.flatpak.enable = true; # needs portals
services.gnome.gnome-keyring.enable = true; 
xdg.portal.enable = true;
xdg.autostart.enable = true;
xdg.portal.xdgOpenUsePortal = true;
xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal
    pkgs.xdg-desktop-portal-gtk
    pkgs.xdg-desktop-portal-xapp
];

}

