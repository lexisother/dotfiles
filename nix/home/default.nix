{ inputs, self, ... }:
{
  imports = [ inputs.home-manager.darwinModules.home-manager ];

  config = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      extraSpecialArgs = {
        inherit self inputs;
      };

      users.alyxia = ./home;
    };
  };
}
