{
  description = "flake of the lyxer...";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dotfiles = {
      url = "https://github.com/lexisother/dotfiles";
      type = "git";
      submodules = true;
      flake = false;
    };
  };

  # add the inputs declared above to the argument attribute set
  outputs =
    {
      self,
      darwin,
      ...
    }@inputs:
    let
      lib = import ./lib { inherit inputs; };
    in
    {
      inherit lib;

      darwinConfigurations.alymac = darwin.lib.darwinSystem {
        specialArgs = { inherit lib self inputs; };
        modules = [
          ./modules/common
          ./modules/darwin

          ./home

          ./hosts/alymac
        ];
      };
    };
}
