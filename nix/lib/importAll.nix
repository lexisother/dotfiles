{ lib }:
let
  inherit (lib)
    map
    filter
    path
    attrNames
    filterAttrs
    pathExists
    elem
    match
    ;

  inherit (builtins) readDir baseNameOf;
in
exclude: cwd:
filter (e: !elem e exclude) (
  map (p: path.append cwd p) (
    attrNames (
      filterAttrs (
        p: t:
        let
          d = t == "directory";
          b = baseNameOf p;
        in
        d && pathExists (path.append cwd (p + "/default.nix"))
        || !d && match ''.*\.nix'' b != null && b != "default.nix"
      ) (readDir cwd)
    )
  )
)
