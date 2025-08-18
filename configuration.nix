# nixos-rebuild switch -I nixos-config=/home/user1/nixos/configuration.nix
# nix-prefetch-url "https://marketplace.visualstudio.com/_apis/public/gallery/publishers/tal7aouy/vsextensions/theme/3.1.0/vspackage"
{ config, pkgs, ... }:

let
    version = "25.05";
    user = "user1";
    host = "computer1";
    timezone ="America/Los_Angeles";
    home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz;
in

{   nix.settings.experimental-features = [ "nix-command" "flakes" ];

imports = [ 
    /etc/nixos/hardware-configuration.nix
    (import "${home-manager}/nixos")
    
];

# boot
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;

# network
networking.hostName = host; 
networking.networkmanager.enable = true;

# Set your time zone.
time.timeZone = timezone;
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

# xserver
services.xserver.enable = true;
services.xserver.desktopManager.xfce.enable = true;
services.xserver.displayManager.lightdm.enable = true;
services.xserver.xkb = {
    layout = "us";
    variant = "";
};
# services.xserver.libinput.enable = true;
# services.printing.enable = true;

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

# account 1
users.users.${user} = {
    isNormalUser = true;
    description= user;
    extraGroups = [ "networkmanager" "wheel" ];
};

home-manager.users.${user} = { pkgs, ... }: {
imports = [
    ./modules/rofi.nix
    # ./modules/vscode.nix
    # ./modules/fastfetch.nix
    ./modules/xfconf.nix

];
home.file = { 
    "Pictures" = { source = ./Pictures; recursive = true; };  
}; 

home.packages = with pkgs; [ 
    rofi
    vscode
    fastfetch
]; home.stateVersion = "25.05"; };
# home-manager.users.root.home.stateVersion = "25.05";

# system
nixpkgs.config.allowUnfree = true; environment.systemPackages = with pkgs; [
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
]; system.stateVersion = version; 

fonts.packages = with pkgs; [
    adwaita-fonts
    font-awesome
    font-awesome_4
    font-awesome_5
    nerd-fonts.adwaita-mono
];


# portals
services.flatpak.enable = true; # needs portals
services.gnome.gnome-keyring.enable = true; 
xdg.portal.enable = true;
xdg.autostart.enable = true;
xdg.portal.xdgOpenUsePortal = true;
xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal
    pkgs.xdg-desktop-portal-gtk
];

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
    switch = "nixos-rebuild switch -I nixos-config=/home/${user}/nixos/configuration.nix";
};

}

# turn off metrics vscode
# xfce menu logo
# light dm profile logo or remove
# librewolf dark theme
# librewolf extensions
# librewolf bookmarks
# flatpak add remote ref



