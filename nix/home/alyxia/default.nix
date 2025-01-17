{ lib, ... }:

{
  imports = lib.importAll [ ] ./.;

  home.stateVersion = "24.05";
}
