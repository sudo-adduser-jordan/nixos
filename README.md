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
{

description = "the best description ever";

inputs = {
    version = "25.05";
    user = "user1";
    host = "computer1";
    timezone ="America/Los_Angeles";
    
    nixpkgs.url = "nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
};

outputs = { self, nixpkgs }: {
    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;
};

}

```


## flake inputs
```nix
inputs = {
    version = "25.05";
    user = "user1";
    host = "computer1";
    timezone ="America/Los_Angeles";
    
    nixpkgs.url = "nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
};
```

## flake outputs
```nix
outputs = { self, nixpkgs }: {
    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;
};
```

## flake system settings
```nix 
systemSettings = {
  system = "x86_64-linux";  # system arch
  hostname = "computer1";   # hostname
};
```

## flake user settings
```nix
userSettings = {
  username = "user1";
  name = "user1";
  email = "user1opez01@gmail.com";
  dotfilesDir = "~/.dotfiles"; # absolute path of the local repo
  # wm = "xfce"; # Selected window manager or desktop environment; must select one in both ./user/wm/ and ./system/wm/
  # editor = "code"
};
```

# configuration.nix
```nix  
```

## imports
```nix 
```

## bootloader
```nix
# bootloader.
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;
```

## networking
```nix
# networking
networking.hostName = "computer1"; # Define your hostname.
networking.networkmanager.enable = true; # Enable networking
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;
```

## usb
```nix
services.devmon.enable = true;
services.gvfs.enable = true; # gnome virtual file system
services.udisks2.enable = true;
```

## Sound
```nix
# Enable sound with pipewire.
# services.pulseaudio.enable = false;
# security.rtkit.enable = true;
# services.pipewire = {
#   enable = true;
#   alsa.enable = true;
#   alsa.support32Bit = true;
#   pulse.enable = true;
#   # If you want to use JACK applications, uncomment this
#   #jack.enable = true;
#   #media-session.enable = true;
# };
```

## fonts
```nix
# fonts.packages = with pkgs; [
#   nerd-fonts.fira-code
#   nerd-fonts.droid-sans-mono
#   nerd-fonts.jetbrains-mono
# ];
```

## time zone
```nix
# Set your time zone.
time.timeZone = "America/New_York";

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
# enable the x11 windowing system.
# services.xserver = {
#   enable = true;
#   desktopManager = {
#     xfce = {
#       enable = true;
#     };
#   };
# };
# services.displayManager.defaultSession = "xfce";

# # Enable the XFCE Desktop Environment.
# services.xserver.displayManager.lightdm.enable = true;
# services.xserver.desktopManager.xfce.enable = true;

```

## x11 keymap
```nix
# configure keymap in x11
# services.xserver.xkb = {
#   layout = "us";
#   variant = "";
# };

```

## printer
```nix
# Enable CUPS to print documents.
services.printing.enable = true;
```

## users
```nix
# Define a user account. Don't forget to set a password with ‘passwd’.
users.users.user1 = {
  isNormalUser = true;
  description = "user1 Lopez";
  # adding mlocate to use find file within doom emacs
  extraGroups = [ "networkmanager" "wheel" "storage" "input" "dialout" "video" "render" "mlocate"];
  packages = with pkgs; [
  #  thunderbird
  ];
};
```

## system packages
```nix
# Install firefox.
programs.firefox.enable = true;

# Allow unfree packages
nixpkgs.config.allowUnfree = true;

# List packages installed in system profile. To search, run:
# $ nix search wget
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
nix.settings.experimental-features = [ "nix-command" "flakes" ];

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
{ config, pkgs, ... }:

{
<<home.nix.imports>>
<<home.nix>>
}
```

## home.nix imports
See [[*home.nix modules][home.nix modules]].

## default settings
```nix
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "user1";
  home.homeDirectory = "/home/user1";

  nixpkgs.config.allowUnfree = true;
  # sessionPath = ["/home/user1/.config/emacs"];

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.
```

## home.nix packages inbox
```nix
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
```
## home.nix dotfiles
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

## environment variables

```nix
  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/user1/etc/profile.d/hm-session-vars.sh
  #
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
[[*configuration.nix imports][configuration.nix imports]]
```nix :noweb-ref configuration.nix-imports
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
```nix :tangle ./modules/git.nix
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
```nix :tangle ./modules/python.nix
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
```nix :tangle ./modules/sh.nix
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

### themes.nix
```nix
  home.file."/home/user1/.themes/Everforest-Dark-Soft" = {
    source = ./themes/everforest-xfce-now-window-borders;
    recursive = true;
  };
```

### gtk.nix
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

### xfconf.nix
- [[file:~/.config/xfce4/desktop][Location on disk]]
```nix
  xfconf = {
    enable = true;
    settings = {
```

### keyboard
```nix
      keyboards = {
        "Default/KeyRepeat" = true;
        "Default/KeyRepeat/Delay" = 185;
        "Default/KeyRepeat/Rate" = 75;
      };
```

### panel
```nix
      xfce4-panel = {
        "panels" = [1];
        "panels/panel-1/position" = "p=2;x=3420;y=720";
        "panels/panel-1/size" = 40;
        "panels/panel-1/autohide-behavior" = 2;
        "panels/panel-1/icon-size" = 0;
        "panels/panel-1/length" = 100.0;
        "panels/panel-1/mode" = 1;
        "panels/panel-1/plugin-ids" = [13 2 1 4 6 5 8 9 10];
        "panels/panel-1/position-locked" = false;
        "panels/panel-1/length-adjust" = true;
        "panels/panel-1/background-style" = 0;
        "panels/darkmode" = true;
```

#### desktop settings
```nix
      xfce4-desktop = {
        "backdrop/screen0/monitoreDP-1/workspace0/last-image" =
          "/home/user1/Dropbox/images/Tranquil_Solitude_social.jpg";
        "desktop-icons/style" = 0;

      };

```

#### keyboard shortcuts
```nix
      xfce4-keyboard-shortcuts = {
        "commands/custom/override" = true;

```
#### run scripts
```nix
        # Scripts
        "commands/custom/<Super>Print" = "dl-simulate-keystrokes";
        "commands/custom/<Primary><Alt>c" = "xdotool mousemove 1750 60 click 1";
        "commands/custom/<Super>q" = "pkill -USR1 '^redshift$'";

```

### run Emacs scripts
```nix
        # Emacs Scripts
        "commands/custom/<Super>Insert" = "emacsclient --eval \"(emacs-everywhere)\"";
        "commands/custom/<Super>i" = "emacsclient --eval \"(emacs-everywhere)\"";
        "commands/custom/<Super>BackSpace" = "/home/user1/.config/emacs/bin/org-capture";
        "commands/custom/<Alt>Favorites" = "/home/user1/.config/emacs/bin/org-capture";

```
#### launch apps
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
#### screenshot
```nix
        # Screenshot
        "commands/custom/<Alt>Print" = "xfce4-screenshooter -w";
        "commands/custom/Print" = "xfce4-screenshooter";
        "commands/custom/<Shift>Print" = "xfce4-screenshooter -r";

```

#### XFWM4 Keybindings / Window Manager Keybindings
#### Select window options
```nix
        # xfwm4/custom
        "xfwm4/custom/override" = true;

        "xfwm4/custom/<Alt>Tab" = "cycle_windows_key";
        "xfwm4/custom/<Shift><Alt>ISO_Left_Tab" = "cycle_reverse_windows_key";

        "xfwm4/custom/<Shift><Super>space" = "popup_menu_key"; # window menu options
        "xfwm4/custom/<Super>Delete" = "close_window_key";

```
#### Move windows
```nix
        # Move windows
        "xfwm4/custom/<Alt><Super>1" = "move_window_workspace_1_key";
        "xfwm4/custom/<Alt><Super>2" = "move_window_workspace_2_key";
        "xfwm4/custom/<Super>bracketright" = "move_window_to_monitor_right_key";
        "xfwm4/custom/<Super>bracketleft" = "move_window_to_monitor_left_key";

```
#### Resize windows
```nix
        # Resize windows
        "xfwm4/custom/<Alt>w" = "maximize_window_key";
        "xfwm4/custom/<Alt>m" = "move_window_key";
        "xfwm4/custom/<Alt>r" = "resize_window_key";
        "xfwm4/custom/<Alt>v" = "maximize_vert_key";
        "xfwm4/custom/<Super>f" = "fullscreen_key";

```
#### Tile windows
```nix
        # Tile windows
        "xfwm4/custom/<Super>h" = "tile_left_key";
        "xfwm4/custom/<Super>l" = "tile_right_key";
        # "xfwm4/custom/<Shift><Super>h" = "tile_up_left_key";
        # "xfwm4/custom/<Shift><Super>j" = "tile_down_left_key";
        # "xfwm4/custom/<Shift><Super>k" = "tile_down_right_key";
        # "xfwm4/custom/<Shift><Super>Left" = "move_window_left_key";
        "xfwm4/custom/<Shift><Super>Right" = "move_window_right_key";
        "xfwm4/custom/<Shift><Super>Up" = "move_window_up_key";
        "xfwm4/custom/<Shift><Super>Down" = "move_window_down_key";
```

#### xsettings
```nix
     xsettings = {
       "Gtk/FontName" = "Sans 14";
       "ThemeName" = "Everforest-Dark-Soft";
       "IconThemeName" = "elementary-Xfce-dark";
     };
```
#### XFWM4 Theme
```nix
      xfwm4 = {
        "general/theme" = "Everforest-Dark-Soft";
      };
```

### GPG Configuration

```nix
  programs.gpg.enable = true;
  services.gpg-agent.enable = true;
```


# System modules

## bluetooth.nix
- [[*home.nix modules][home.nix modules]]
```nix :tangle ./system/bluetooth.nix
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
```nix :tangle ./system/pipewire.nix
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
[[*Fonts][Fonts]]
```nix :tangle ./system/fonts.nix
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
```nix :tangle ./system/gnome-keyring.nix
{ ... }:

{
  services.gnome = {
    gnome-keyring.enable = true;
  };
}
```


#### Autostart
```nix conf
```

#### Environment variables

```nix conf
```

#### Permissions

```nix conf
```

#### Scripts
```nix conf
```

#### windows
```nix conf
```
