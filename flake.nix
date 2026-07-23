{
  description = "Declarative NixOS homelab infrastructure";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    colmena = {
      url = "github:nix-community/colmena";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      disko,
      colmena,
      sops-nix,
      ...
    }:

    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
      };

      k72jrModules = [
        disko.nixosModules.disko
        sops-nix.nixosModules.sops
        ./hosts/k72jr
      ];
    in
    {
      nixosConfigurations.k72jr = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs;
        };

        modules = k72jrModules;
      };

      colmenaHive = colmena.lib.makeHive {
        meta = {
          nixpkgs = pkgs;

          specialArgs = {
            inherit inputs;
          };

          allowApplyAll = false;
        };

        k72jr = {
          imports = k72jrModules;

          deployment = {
            targetHost = "k72jr";
            targetUser = "serafin";

            tags = [
              "servers"
              "homelab"
              "legacy-hardware"
            ];

            buildOnTarget = false;
          };
        };
      };

      devShells.${system}.default = pkgs.mkShell {
        packages = [
          colmena.packages.${system}.colmena

          pkgs.sops
          pkgs.age
          pkgs.ssh-to-age
        ];
      };
    };
}