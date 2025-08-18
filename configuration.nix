{ config, pkgs, specialArgs, ... }:

{ nixpkgs.config.allowUnfree = true; 

imports = [
/etc/nixos/hardware-configuration.nix
./modules/xfce.nix
# ./modules/_all-systems.nix
# ./modules/gnupg.nix
# ./modules/ssh.nix
# ./modules/chromium.nix
# ./modules/cups.nix
# ./modules/direnv.nix
# ./modules/firefox.nix
# ./modules/flatpak.nix
# ./modules/git.nix
# ./modules/helix.nix
# ./modules/imv.nix
# ./modules/pipewire.nix
# ./modules/ripgrep.nix
./modules/rofi.nix
# ./modules/steam.nix
# ./modules/virtualbox.nix
];

# Bootloader
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;
# boot.kernelPackages = pkgs.linuxPackages_latest; # kernel version

# Networking
networking = {
    hostName = specialArgs.user;
    networkmanager.enable = true;
};

# Set your time zone.
# time.timeZone = timezone;
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

# Audio via Pipewire
services.pulseaudio.enable = false;
security.rtkit.enable = true;
services.pipewire = {

enable = true;
alsa.enable = true;
alsa.support32Bit = true;
pulse.enable = true;
#jack.enable = true;

};

# Home Manager
home-manager.users.${specialArgs.user} = {
    home.stateVersion = specialArgs.version;
    # home.file = { "Pictures" = { source = ./Pictures; recursive = true; }; }; 
};
home-manager.users.root.home.stateVersion = specialArgs.version;

users.users.${specialArgs.user} = {

isNormalUser = true;
description = specialArgs.user;
extraGroups = [ "networkmanager" "wheel" ];
# hashedPasswordFile = config.sops.secrets.passwd.path;

packages = with pkgs; [
rofi
vscode

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

xfce.xfce4-whiskermenu-plugin

flatpak
xdg-utils
xdg-desktop-portal
xdg-desktop-portal-gtk

icon-library
# nixos-icons

theme-obsidian2
adwaita-icon-theme
morewaita-icon-theme

nerd-fonts.adwaita-mono
nerd-fonts.jetbrains-mono

];};

# fonts.packages = with pkgs; [
#     adwaita-fonts
#     font-awesome
#     font-awesome_4
#     font-awesome_5
#     nerd-fonts.adwaita-mono
# ];




# users.users.${specialArgs.guest} = {
#     isNormalUser = true;
#     description = specialArgs.guest;
#     extraGroups = [ "networkmanager" "wheel" ];
#     hashedPasswordFile = config.sops.secrets.passwd.path;
#     packages = with pkgs; [
#       # Add your packages here
#     ];
# };



# vars
environment.variables = {
};

# aliases
environment.shellAliases = {
    codenix = "code ~/nixos";
    clean = "nix-collect-garbage";
    channels = "nix-channel --list";
    channels-update = "nix-channel --update";
    # update = "nixos-rebuild switch --upgrade";
    rollback = "nixos-rebuild switch --rollback";
    generations-delete = "nix-env --delete-generations";
    generations = "nix-env -p /nix/var/nix/profiles/system --list-generations";
    switch-root = "nixos-rebuild switch";
    # switch = "nixos-rebuild switch -I nixos-config=/home/${user}/nixos/configuration.nix";
    # switch = "nixos-rebuild switch --flake /home/user1/nixos; # impure
    # switch = "nixos-rebuild switch --flake ~/nixos; # pure
};



# portals
# services.flatpak.enable = true; # needs portals
# services.gnome.gnome-keyring.enable = true; 
# xdg.portal.enable = true;
# xdg.autostart.enable = true;
# xdg.portal.xdgOpenUsePortal = true;
# xdg.portal.extraPortals = [
#     pkgs.xdg-desktop-portal
#     pkgs.xdg-desktop-portal-gtk
# ];





  system.stateVersion = specialArgs.version;
}

# home-manager.users.root.home.stateVersion = "25.05";
