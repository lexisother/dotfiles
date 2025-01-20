{ lib, ... }:
{
  manual = lib.mapAttrs (_: lib.mkForce) {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };
}
