{
  description = "flake of the lyxer...";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-23.05-darwin";
      home-manager.url = "github:nix-community/home-manager/release-23.05";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
      # nix will normally use the nixpkgs defined in home-managers inputs, we only want one copy of nixpkgs though
      darwin.url = "github:lnl7/nix-darwin";
      darwin.inputs.nixpkgs.follows = "nixpkgs"; # ...
      dotfiles = {
        url = "https://github.com/keanuplayz/dotfiles";
        type = "git";
        submodules = true;
        flake = false;
      };
  };

  # add the inputs declared above to the argument attribute set
  outputs = { self, nixpkgs, home-manager, dotfiles, darwin }: {
    darwinConfigurations."alymac" = darwin.lib.darwinSystem {
      system = "x86_64-darwin";
      specialArgs = { inherit self; inherit dotfiles; };
      modules = [
        home-manager.darwinModules.home-manager
        ./hosts/alymac/default.nix
      ];
    };
  };
}
