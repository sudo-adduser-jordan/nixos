# nixos 

>1. clone `source` into `home`

```sh
    git clone https://github.com/sudo-adduser-user1/nixos
```
>2. `switch` from `source`

```sh
    nixos-rebuild switch -I nixos-config=/home/{user_account_containing source}/nixos/configuration.nix
```

>3. you can now edit your `source` in 

```sh
   code ~/nixos # vim is for nerds
```

>4. and `switch` to a new configuration

```sh
    sudo switch
```

> to revert back

```sh
rollback
```

# TODO List
> imports

> configs

> flakes

# Resources
> Official Documentation

> Third Party Documenation

> Commands

# Organization

`nixos/`
- configuration.nix: System configuration
- flake.nix: Flake configuration, this rarely changes
- home.nix: Home configuration, this changes all the time

# flake.nix
```nix 
{ # nixos-rebuild dry-run --flake /home/user1/nixos --impure --show-trace
description = "NixOS config flake";

inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
};

outputs = { self, nixpkgs, home-manager, ... } @ inputs:
let
    version = "25.05";      
    host = "computer1";
    user = "user1";
    timezone ="America/Los_Angeles";
in
{ # Single system configuration

nixosConfigurations = {

computer1 = nixpkgs.lib.nixosSystem {
system = "x86_64-linux";
modules = [
inputs.home-manager.nixosModules.home-manager
./configuration.nix
];
specialArgs = {
    inherit inputs;
    inherit host;
    inherit user;
    inherit version;
    inherit timezone;
};};

# desktop = nixpkgs.lib.nixosSystem {
# system = "x86_64-linux";
# modules = [
# inputs.home-manager.nixosModules.home-manager
# ./configuration.nix
# ];
# specialArgs = {
#     inherit inputs;
#     inherit host;
#     inherit user;
#     inherit version;
#     inherit timezone;
# };};

# laptop = nixpkgs.lib.nixosSystem {
# system = "x86_64-linux";
# modules = [
# inputs.home-manager.nixosModules.home-manager
# ./configuration.nix
# ];
# specialArgs = {
#     inherit inputs;
#     inherit host;
#     inherit user;
#     inherit version;
#     inherit timezone;
# };};
};

};
}
```


## flake inputs
```nix
inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
};
```

## flake outputs
```nix

outputs = { self, nixpkgs, home-manager, ... } @ inputs:
let
    version = "25.05";      
    host = "computer1";
    user = "user1";
    timezone ="America/Los_Angeles";
in
{ nixosConfigurations = {

# Single system configuration
computer1 = nixpkgs.lib.nixosSystem {
system = "x86_64-linux";
modules = [
inputs.home-manager.nixosModules.home-manager
./configuration.nix
];
specialArgs = {
    inherit inputs;
    inherit host;
    inherit user;
    inherit version;
    inherit timezone;
};};

# desktop = nixpkgs.lib.nixosSystem {
# system = "x86_64-linux";
# modules = [
# inputs.home-manager.nixosModules.home-manager
# ./configuration.nix
# ];
# specialArgs = {
#     inherit inputs;
#     inherit host;
#     inherit user;
#     inherit version;
#     inherit timezone;
# };};

# laptop = nixpkgs.lib.nixosSystem {
# system = "x86_64-linux";
# modules = [
# inputs.home-manager.nixosModules.home-manager
# ./configuration.nix
# ];
# specialArgs = {
#     inherit inputs;
#     inherit host;
#     inherit user;
#     inherit version;
#     inherit timezone;
# };};

};};
```

## flake system settings
```nix 
```

## flake user settings
```nix
```

# configuration.nix
```nix  
nix.settings.experimental-features = [ "nix-command" "flakes" ];

```

## imports
```nix 
```

## bootloader
```nix
```

## networking
```nix
```

## usb
```nix
services.devmon.enable = true;
services.gvfs.enable = true; # gnome virtual file system
services.udisks2.enable = true;
```

## Sound
```nix
```

## fonts
```nix
# fonts.packages = with pkgs; [
# ];
```

## time zone
```nix

```
## file encoding
```nix
# Select internationalisation properties.
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

```

## enable x11 windowing system
```nix

```

## x11 keymap
```nix
```

## printer
```nix
```

## users
```nix
```

## system packages
```nix
environment.systemPackages = with pkgs; [

];
```

## automatic updating
```nix
system.autoUpgrade.enable = true;
system.autoUpgrade.dates = "weekly";
```

## garbage collection
```nix
nix.gc.automatic = true;
nix.gc.dates = "weekly";
nix.gc.options = "--delete-older-than 14d";
nix.settings.auto-optimise-store = true;
```

## additional config
```nix

# Enable touchpad support (enabled default in most desktopManager).
# services.xserver.libinput.enable = true;

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# Enable the OpenSSH daemon.
# services.openssh.enable = true;
```
# home.nix

```nix 
```

## home imports
```nix 
```

## home settings settings
```nix
home.username = "user1";
home.homeDirectory = "/home/user1";
nixpkgs.config.allowUnfree = true;
home.stateVersion = "25.05"; 
```

## home packages
```nix
  home.packages = [
  ];
```
## home dotfiles
```nix
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
```

## home environment variables

```nix
  home.sessionVariables = {
    # EDITOR = "emacs";
  };
```

## home-manager configuration
```nix
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
```

# Modules

## configuration.nix modules
```nix 
imports =
  [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/xfce/xfce.nix
    # ./system/hyprland.nix
    ./modules/steam.nix
    ./system/bluetooth.nix
    ./system/pipewire.nix
  ];
```

## home.nix modules
```nix :noweb-ref home.nix.imports
  imports = [
    ./modules/xfce/xfce-home.nix
    # ./modules/wm/hyprland-minimal.nix
    # ./modules/hyprland/hyprland-home.nix
    ./modules/python.nix
    ./modules/sh.nix
    ./modules/scripting.nix
    ./modules/emacs.nix
    ./modules/brave.nix
    ./modules/minecraft.nix
    ./modules/watchy.nix
  ];
```

## git.nix
```nix 
{ config, pkgs, userSettings, ... }:

{
  home.packages = [
    pkgs.git
    pkgs.git-credential-manager
                  ];
  programs.git.enable = true;
  programs.git.userName = userSettings.name;
  programs.git.userEmail = userSettings.email;
  # programs.git.extraConfig = {
  #   init.defaultBranch = "main";
  #   safe.directory = [ ("/home/" + userSettings.username + "/.dotfiles")
  #                      ("/home/" + userSettings.username + "/.dotfiles/.git") ];
  # };
}
```

## python.nix
```nix 
{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    (python312.withPackages (python3Packages: with python3Packages; [
      jupyter

      numpy
      sympy
      pandas
      scipy
      matplotlib
      seaborn
      plotly
      networkx
      requests
      markdownify
      discordpy
    ]))
  ];
}
```

## scripting.nix
```nix 
{ config, lib, pkgs, ... }:

{

  home.packages = with pkgs; [
    jumpapp
    libnotify # forr sending notifcations
    wmctrl #for window management
    (pkgs.writeScriptBin "dl-caps-lock-to-control" ''
setxkbmap -option caps:none && setxkbmap -option ctrl:nocaps && setxkbmap -option caps:ctrl && setxkbmap -option "shift:both_capslock"
'')

    (pkgs.writeScriptBin "dl-restart-wifi" ''
nmcli networking off
nmcli networking on
'')
    (pkgs.writeScriptBin "dl-simulate-keystrokes" ''
#!/bin/sh
notify-send 'Simulate Keystrokes' 'Will type out current clipboard contents' -i ~/bin/KeyboardIconW.png -t 3500
notify-send 'Simulate Keystrokes' 'Will type in: 3' -t 1000
sleep 1
notify-send 'Simulate Keystrokes' 'Will type in: 2' -t 1000
sleep 1
notify-send 'Simulate Keystrokes' 'Will type in: 1' -t 1000
sleep 1
xdotool type -- "$(xsel -bo | tr \\n \\r | sed s/\\r*\$//)"
'')

  ];
}
```

## sh.nix
```nix 
{ config, lib, pkgs, userSettings, ... }:
let
  myAliases = {
    ll = "ls -la";
    ec = "emacsclient";
    myname = "echo " + userSettings.username;
  };
in
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
    initContent = ''
    PROMPT=" - %U%F{magenta}%n%f%u@%U%F{blue}%m%f%u:%F{yellow}%~%f
     %F{green}→%f "
    RPROMPT="%F{red}|%f%F{yellow}|%f%F{green}|%f%F{cyan}|%f%F{blue}|%f%F{magenta}|%f%F{white}|%f"
    [ $TERM = "dumb" ] && unsetopt zle && PS1='$ '
    bindkey '^P' history-beginning-search-backward
    bindkey '^N' history-beginning-search-forward
    '';
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
  };

  home.sessionPath = [
    "~/.config/emacs/bin"
  ];
  home.packages = with pkgs; [
    # disfetch lolcat cowsay onefetch
    # gnugrep gnused
    # bat eza bottom fd bc
    # direnv nix-direnv
  ];

  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;
}
```

## steam.nix
```nix 
{ config, lib, pkgs, ... }:

{
  # https://nixos.wiki/wiki/Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
}
```

## xfce.nix
```nix 
{ config, lib, pkgs, ... }:

# https://gist.github.com/nat-418/1101881371c9a7b419ba5f944a7118b0
{
  environment = {
    systemPackages = with pkgs; [
      redshift
      geoclue2
      dropbox
      blueman
      vim
      git
      firefox
      font-manager
      # file-roller # broken
      gnome-disk-utility
      libreoffice
      orca
      pavucontrol # pulseaudio
      wmctrl
      xclip
      xcolor
      xcolor
      xdo
      xdotool
      xfce.catfish
      xfce.gigolo
      xfce.orage
      xfce.xfburn
      xfce.xfce4-appfinder
      xfce.xfce4-clipman-plugin
      xfce.xfce4-cpugraph-plugin
      xfce.xfce4-dict
      xfce.xfce4-fsguard-plugin
      xfce.xfce4-genmon-plugin
      xfce.xfce4-netload-plugin
      xfce.xfce4-panel
      xfce.xfce4-pulseaudio-plugin
      xfce.xfce4-systemload-plugin
      xfce.xfce4-weather-plugin
      xfce.xfce4-whiskermenu-plugin
      xfce.xfce4-xkb-plugin
      xfce.xfdashboard
      xorg.xev
      xorg.xkill
      xsel
      xwinmosaic
    ];
  };
  hardware = {
    bluetooth.enable = true;
  };

  programs = {
    dconf.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-volman
      ];
    };
  };

  # security.pam.services.gdm.enableGnomeKeyring = true;

  services = {
    blueman.enable = true;
    # gnome.gnome-keyring.enable = true;
    pipewire = { # multimedia framework
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };
    xserver = {
      enable = true;
      excludePackages = with pkgs; [
        xterm
      ];
      displayManager = {
        lightdm = {
          enable = true;
          greeters.slick = {
            enable = true;
            theme.name = "Zukitre-dark";
          };
        };
      };
      desktopManager.xfce.enable = true;
    };
  };
}
```

## xfce-home.nix
```nix 
{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    (pkgs.writeScriptBin "dl-xfce-autostart" ''
#!/usr/bin/env bash
dl-switch-caps-lock-to-control &
dropbox &
dl-restart-emacs &
redshift -l 42.361145:-71.057083 &
    '')

    ];
<<xfce-home>>


}
```

## themes.nix
```nix
  home.file."/home/user1/.themes/Everforest-Dark-Soft" = {
    source = ./themes/everforest-xfce-now-window-borders;
    recursive = true;
  };
```

## gtk.nix
```nix
  gtk = {
    enable = true;
      iconTheme = {
      name = "elementary-Xfce-dark";
      package = pkgs.elementary-xfce-icon-theme;
    };
    theme = {
      name = "Everforest-Dark-Soft";
    #   name = "zukitre-dark";
    #   package = pkgs.zuki-themes;
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
```

## xfconf.nix
```nix
```

## keyboard
```nix
      keyboards = {
        "Default/KeyRepeat" = true;
        "Default/KeyRepeat/Delay" = 185;
        "Default/KeyRepeat/Rate" = 75;
      };
```

## panel
```nix
```

## desktop settings
```nix

```

## keyboard shortcuts
```nix
```

## run scripts
```nix
        # Scripts
        "commands/custom/<Super>Print" = "dl-simulate-keystrokes";
        "commands/custom/<Primary><Alt>c" = "xdotool mousemove 1750 60 click 1";
        "commands/custom/<Super>q" = "pkill -USR1 '^redshift$'";

```

## launch apps
```nix
        # Launching apps
        "commands/custom/<Super>space" = "xfce4-appfinder";
        "commands/custom/<Alt>0" = "dl-restart-emacs-daemon";
        "commands/custom/<Alt>e" = "dl-jumpapp-emacs";
        "commands/custom/<Super>Tab" = "jumpapp -m thunar";
        "commands/custom/<Super>b" = "jumpapp -m blueman-manager";
        "commands/custom/<Super>c" = "jumpapp -m brave";
        "commands/custom/<Super>e" = "jumpapp-emacs";
        "commands/custom/<Super>t" = "jumpapp xfce4-terminal";
        "commands/custom/<Primary><Alt>Delete" = "xfce4-session-logout";
        "commands/custom/<Primary><Shift>Escape" = "xfce4-taskmanager";
        "commands/custom/<Super>minus" = "xkill";

```
## screenshot
```nix
```

## XFWM4 Keybindings / Window Manager Keybindings
## Select window options
```nix

```
## Move windows
```nix

```
## Resize windows
```nix

```
## Tile windows
```nix
```

## xsettings
```nix
```
## XFWM4 Theme
```nix
```

## GPG Configuration

```nix
  programs.gpg.enable = true;
  services.gpg-agent.enable = true;
```


# System modules

## bluetooth.nix
- [[*home.nix modules][home.nix modules]]
```nix 
{ config, lib, pkgs, ... }:

{
  # Enable bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  environment.systemPackages = with pkgs; [
    bluez-tools
  ];
}
```

## pipewire.nix
```nix 
{ ... }:

{

  # services = {
  #   blueman.enable = true;
  #   # gnome.gnome-keyring.enable = true;
  #   pipewire = { # multimedia framework
  #     enable = true;
  #     alsa = {
  #       enable = true;
  #       support32Bit = true;
  #     };
  #     pulse.enable = true;
  #   };
  # };

  # services.pulseaudio.enable = false;
  # Pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # jack.enable = true;
  };
}
```

## dbus.nix
```nix :tangle ./system/dbus.nix
{ pkgs, ... }:

{
  services.dbus = {
    enable = true;
    packages = [ pkgs.dconf ];
  };

  programs.dconf = {
    enable = true;
  };
}
```

## fonts.nix
```nix 
{ config, pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    nerd-fonts.jetbrains-mono
  ];
}
```

## gnome-keyring.nix
```nix .nix
{ ... }:

{
  services.gnome = {
    gnome-keyring.enable = true;
  };
}
```


## autostart
```nix conf
```

## system environment variables

```nix conf
```

## system environment alias

```nix conf
```


# Permissions

```nix conf
```
```
