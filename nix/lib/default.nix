{ inputs }:
let
  lib0 = inputs.nixpkgs.lib;

  myLib = lib0.makeExtensible (
    self:
    let
      callLib = file: import file { lib = self; };
    in
    {
      importAll = callLib ./importAll.nix;
    }
  );

  lib = myLib.extend (_: _: lib0);
in
lib
