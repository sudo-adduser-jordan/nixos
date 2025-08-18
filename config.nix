{ config, pkgs, specialArgs, ... }:

{
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
# ./modules/rofi.nix
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

  system.stateVersion = specialArgs.version;
}