# nixos-rebuild switch -I nixos-config=/home/user1/nixos/configuration.nix
# nix-prefetch-url "https://marketplace.visualstudio.com/_apis/public/gallery/publishers/tal7aouy/vsextensions/theme/3.1.0/vspackage"
{ config, pkgs, ... }:

let
    # version = "stable 25"
    user = "user1";
    host = "computer1";
    home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz;
in

{
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

# xserver
services.xserver.enable = true;
services.xserver.desktopManager.xfce.enable = true;
services.xserver.displayManager.lightdm.enable = true;
services.xserver.displayManager.lightdm.extraConfig = ''
# Custom configuration options
'';
services.xserver.xkb = {
    layout = "us";
    variant = "";
};
# services.printing.enable = true;
# services.xserver.libinput.enable = true;

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
home.file = { 
    "Pictures" = {
        source = ./Pictures;
        recursive = true;
    };  
    ".config" = {
        source = ./.config;
        recursive = true;
    };
}; 

nixpkgs.config.allowUnfree = true;
home.packages = with pkgs; [ 
    rofi
    fastfetch

    vscode
    # (vscode-with-extensions.override {
    # vscodeExtensions = with vscode-extensions; [
    #     bbenoist.nix
    #     golang.go
    #     bbenoist.nix
    #     redhat.vscode-xml
    #     redhat.vscode-yaml
    #     usernamehw.errorlens
    #     ibm.output-colorizer
    #     ritwickdey.liveserver
    #     esbenp.prettier-vscode
    #     astro-build.astro-vscode
    #     mechatroner.rainbow-csv
    #     gitlab.gitlab-workflow
    #     catppuccin.catppuccin-vsc
    #     github.github-vscode-theme
    #     yzhang.markdown-all-in-one
    #     elixir-lsp.vscode-elixir-ls
    #     vscode-icons-team.vscode-icons
    #     ms-vscode.cpptools-extension-pack 
    #     vscjava.vscode-java-pack # intelliCode included
    #     # streetsidesoftware.code-spell-checker
    # ] ++ 
    # pkgs.vscode-utils.extensionsFromVscodeMarketplace [ # nix-prefetch-url 
    # { # https://tal7aouy.gallery.vsassets.io/_apis/public/gallery/publisher/tal7aouy/extension/theme/3.1.0/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
    #     name = "theme";
    #     publisher = "tal7aouy";
    #     version = "3.1.0";
    #     sha256 = "1p06l2d30h3c12jcls533hw61irf4nmlxakg5xvxbmlzj55nm4ic";
    # }
    # { # https://rangav.gallery.vsassets.io/_apis/public/gallery/publisher/rangav/extension/vscode-thunder-client/2.37.5/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
    #     name = "vscode-thunder-client";
    #     publisher = "rangav";
    #     version = "2.37.5";
    #     sha256 = "1dignnk5p1j6xs2nkvy37c5ighydifvisg5lz9h63w30i0mj779z";
    # }
    # { # https://qwtel.gallery.vsassets.io/_apis/public/gallery/publisher/qwtel/extension/sqlite-viewer/0.10.6/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
    #     name = "sqlite-viewer";
    #     publisher = "qwtel";
    #     version = "0.10.6";
    #     sha256 = "13d5g0jksxpachvs2d05bvzaaa54wpmcaik4kzcs15acamdjxpvl";
    # }
    # { # https://rw-smups.gallery.vsassets.io/_apis/public/gallery/publisher/rw-smups/extension/gruberfruity/0.8.0/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
    #     name = "gruberfruity";
    #     publisher = "rw-smups";
    #     version = "0.8.0";
    #     sha256 = "1grf69n270gsizg2z053ldjn3k0sy8iv8ja8xrv5iv183x993j1v";
    # }
    # ];})
]; home.stateVersion = "25.05"; };

# system
nixpkgs.config.allowUnfree = true;
fonts.packages = with pkgs; [
    font-awesome
    font-awesome_4
    font-awesome_5
    adwaita-fonts
    nerd-fonts.adwaita-mono
];

environment.systemPackages = with pkgs; [
    gh
    git
    github-desktop

    pnpm
    nodejs_22

    miraclecast

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
]; system.stateVersion = "25.05"; 

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



