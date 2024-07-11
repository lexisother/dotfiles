{
  description = "flake of the lyxer...";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.05-darwin";
      home-manager.url = "github:nix-community/home-manager/release-24.05";
      darwin.url = "github:lnl7/nix-darwin";
      lix.url = "git+https://git.lix.systems/lix-project/nixos-module";
      dotfiles = {
        url = "https://github.com/lexisother/dotfiles";
        type = "git";
        submodules = true;
        flake = false;
      };

      home-manager.inputs.nixpkgs.follows = "nixpkgs";
      darwin.inputs.nixpkgs.follows = "nixpkgs";
      lix.inputs.nixpkgs.follows = "nixpkgs";
  };

  # add the inputs declared above to the argument attribute set
  outputs = { self, nixpkgs, lix, home-manager, dotfiles, darwin }: let
    system = "x86_64-darwin";
    importAll = path: map
      (p: import (path + ("/" + p)))
      (builtins.attrNames (builtins.readDir path));
    pkgs = import nixpkgs {
      inherit system;
      overlays = importAll ./overlays;
    };
    libs = with builtins; listToAttrs (map
      (path: {
        name = replaceStrings [".nix"] [""] path;
        value = (import (pkgs.lib.path.append ./lib path)) { inherit pkgs; };
      })
      (attrNames (readDir ./lib)));
  in {
    darwinConfigurations."alymac" = darwin.lib.darwinSystem {
      inherit system;
      specialArgs = libs;
      modules = [
        ./system
        lix.nixosModules.default
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            extraSpecialArgs = { inherit self; inherit dotfiles; } // libs;
            useGlobalPkgs = true;
            useUserPackages = true;
            users.alyxia.imports = [ ./home ];
          };
        }
      ];
    };
  };
}
