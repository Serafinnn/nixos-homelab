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

      revisionModule = {
        system.configurationRevision =
          inputs.self.rev
          or inputs.self.dirtyRev
          or null;

        system.nixos.label =
          inputs.self.shortRev
          or inputs.self.dirtyShortRev
          or "unknown";
      };

      k72jrModules = [
        revisionModule
        disko.nixosModules.disko
        sops-nix.nixosModules.sops
        ./hosts/k72jr
      ];

      ideapadModules = [
        revisionModule
        disko.nixosModules.disko
        sops-nix.nixosModules.sops
        ./hosts/ideapad
      ];
    in
    {
      nixosConfigurations = {
        k72jr = nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = {
            inherit inputs;
          };

          modules = k72jrModules;
        };
        ideapad = nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = {
            inherit inputs;
          };

          modules = ideapadModules;
        };
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
              "legacy-hardware"
              "docker"
            ];

            buildOnTarget = false;
          };
        };
        ideapad = {
          imports = ideapadModules;

          deployment = {
            targetHost = "ideapad";
            targetUser = "serafin";

            tags = [
              "servers"
              "legacy-hardware"
              "docker"
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