{ # nixos-rebuild dry-run --flake /home/user1/nixos --impure --show-trace
description = "nixos config flake";

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
# ./desktop-configuration.nix
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
# ./laptop-configuration.nix
# ];
# specialArgs = {
#     inherit inputs;
#     inherit host;
#     inherit user;
#     inherit version;
#     inherit timezone;
# };};

};};

}