{ # nixos-rebuild dry-run --flake /home/user1/nixos --impure --show-trace

  description = "NixOS config flake";

  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

outputs = { self, nixpkgs, home-manager, ... } @ inputs:
let
  version = "25.05"; # can add multiple
  host = "computer1"; # can add multiple
  user = "user1";
  user2 = "user2";
  guest = "guest";
in
{
  # Single system configuration
  nixosConfigurations.${host} = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      inputs.home-manager.nixosModules.home-manager
    #   ./hosts/${host}/configuration.nix
    #   ./home/${user}/nixos/configuration.nix
     "/home/user1/nixos/config.nix"
    #   ./config.nix
    ];
    specialArgs = {
      inherit inputs;
      inherit host;
      inherit user;
      inherit user2;
      inherit guest;
      inherit version;
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