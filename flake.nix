{
  description = "Declarative NixOS homelab infrastructure";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    disko,
    ...
  }@inputs:
  {
    nixosConfigurations = {
      k72jr = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs;
        };

        modules = [
          disko.nixosModules.disko
            ./hosts/k72jr
        ];
      };
    };
  };
}