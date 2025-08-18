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

# Home Manager
home-manager.users.${specialArgs.user} = {
    home.stateVersion = specialArgs.version;
};
home-manager.users.root.home.stateVersion = specialArgs.version;

# Networking
networking = {
    hostName = "proxima";
    networkmanager.enable = true;
};

environment.variables = {
};

# Audio via Pipewire
security.rtkit.enable = true;
services.pipewire = {
enable = true;
alsa.enable = true;
alsa.support32Bit = true;
#jack.enable = true;
pulse.enable = true;
};

users = {

users.${specialArgs.user} = {
    isNormalUser = true;
    description = specialArgs.user;
    extraGroups = [ "networkmanager" "wheel" ];
    # hashedPasswordFile = config.sops.secrets.passwd.path;
    packages = with pkgs; [
      # Add your packages here
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
    
    
    ];
};

# users.${specialArgs.guest} = {
#     isNormalUser = true;
#     description = specialArgs.guest;
#     extraGroups = [ "networkmanager" "wheel" ];
#     hashedPasswordFile = config.sops.secrets.passwd.path;
#     packages = with pkgs; [
#       # Add your packages here
#     ];
# };

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



  system.stateVersion = specialArgs.version;
}