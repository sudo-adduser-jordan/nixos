{ configs, pkgs, ... }:

{
xfconf.enable = true; 
xfconf.settings = {

xfce4-session = {
    # "startup/ssh-agent/enabled" = false;
    # "general/LockCommand" = "${pkgs.lightdm}/bin/dm-tool lock";
};

xfce4-desktop = {
    # "backdrop/screen0/monitorLVDS-1/workspace0/last-image" =
    # "${pkgs.nixos-artwork.wallpapers.stripes-logo.gnomeFilePath}";
};

thunar = {
    # "last-view" = "ThunarCompactView";
    # "misc-show-delete-action" = true;
};

};

}