{ description = "nixos config flake";

inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions/";
    home-manager.url = "github:nix-community/home-manager/release-25.05";  
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # nixpkgs-pinned.url = "github:NixOS/nixpkgs/336eda0d07dc5e2be1f923990ad9fdb6bc8e28e3";
};

outputs = { 
    self,
    nixpkgs,
    home-manager,
    # nixpkgs-pinned,
    nix-vscode-extensions,
    ... } @ inputs:
let
    version = "25.05";      
    host = "computer1";
    user = "user1";
    timezone ="America/Los_Angeles";
in
{ nixosConfigurations = {

computer1 = nixpkgs.lib.nixosSystem {
pkgs = import nixpkgs { # global system package config
    system = "x86_64-linux"; 
    config.allowUnfree = true;
    overlays = [ nix-vscode-extensions.overlays.default ];
};
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
    # ./desktop-hardwares.nix
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
    # ./laptop-hardware.nix
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