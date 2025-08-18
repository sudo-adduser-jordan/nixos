{ # nixos-rebuild dry-run --flake /home/user1/nixos --impure --show-trace
description = "NixOS config flake";

inputs = {

nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
#nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
home-manager = {
    url = "github:nix-community/home-manager/release-25.05";
    inputs.nixpkgs.follows = "nixpkgs";
};

};

outputs = { self, nixpkgs, home-manager, ... } @ inputs:
let
    version = "25.05";      
    host = "computer1";
    user = "user1";
    timezone ="America/Los_Angeles";
in
{ # Single system configuration

nixosConfigurations.${host} = nixpkgs.lib.nixosSystem {
system = "x86_64-linux";
modules = [
    inputs.home-manager.nixosModules.home-manager
    # ./hardware-configuration.nix 
    ./configuration.nix
];

specialArgs = {
    inherit inputs;
    inherit host;
    inherit user;
    inherit version;
    inherit timezone;
};
};
};

}