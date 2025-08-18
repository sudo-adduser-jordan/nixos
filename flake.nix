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

    host = "computer1"; # can add multiple
    user = "user1";
    user2 = "user2";
    guest = "guest";

    timezone ="America/Los_Angeles";
in
{
  # Single system configuration
  nixosConfigurations.${host} = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      inputs.home-manager.nixosModules.home-manager
      /home/${user}/nixos/configuration.nix # main configuration
    ];
    specialArgs = {
      inherit inputs;
      inherit host;
      inherit user;
      inherit user2;
      inherit guest;
      inherit version;
      inherit timezone;
    };
  };

#   # laptop
#   nixosConfigurations.proxima = nixpkgs.lib.nixosSystem {
#     system = "x86_64-linux";
#     modules = [
#       inputs.home-manager.nixosModules.home-manager
#       inputs.sops-nix.nixosModules.sops
#       ./hosts/proxima/configuration.nix
#     ];
#     specialArgs = {
#       inherit inputs primary-user;
#     };
#   };
  
#   # desktop
#   nixosConfigurations.toliman = nixpkgs.lib.nixosSystem {
#     system = "x86_64-linux";
#     modules = [
#       inputs.home-manager.nixosModules.home-manager
#       inputs.sops-nix.nixosModules.sops
#       ./hosts/toliman/configuration.nix
#     ];
#     specialArgs = {
#       inherit inputs primary-user;
#     };
#   };
};

}