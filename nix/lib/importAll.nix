{ pkgs, ... }:

exclude: cwd: with builtins; with pkgs.lib; filter
  (e: !elem e exclude)
  (map
    (p: path.append cwd p)
    (attrNames (attrsets.filterAttrs
      (p: t:
        let
          d = t == "directory";
          b = baseNameOf p;
        in
          d && pathExists (path.append cwd (p + "/default.nix")) ||
          !d && match ''.*\.nix'' b != null && b != "default.nix")
      (readDir cwd))))
