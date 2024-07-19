{ pkgs, ... }:

{
  services.nix-daemon.enable = true;

  nix = {
    settings = {
      # enable flakes and the `nix` command
      experimental-features = [ "nix-command" "flakes" ];

      # disable the flake registry since it worsens perf
      flake-registry = pkgs.writers.writeJSON "flakes-empty.json" {
        flakes = [ ];
        version = 2;
      };

      # "apply the free optimisations"
      auto-optimise-store = true;

      # we need to create some trusted and allwed users so that we can use 
      # some features like substituters
      allowed-users = [
        "@wheel" # allow sudo users to mark the following values as trusted
        "root"
        "alyxia"
      ];
      trusted-users = [
        "@wheel" # allow sudo users to manage the nix store
        "root"
        "alyxia"
      ];

      # enable some extra darwin platforms
      extra-platforms = [
        "aarch64-darwin"
        "x86-64-darwin"
      ];

      # logging stuff
      log-lines = 50;
      warn-dirty = false;

      # continue building derivations even if one failed
      keep-going = true;

      # the more connections the better
      http-connections = 0;

      # whether to accept nix configuration from a flake without prompting. why the
      # hell would you enable this?
      accept-flake-config = false;

      # caching setup
      substituters = [
        "https://cache.nixos.org/"
        "https://nix-community.cachix.org"
        "https://nixpkgs-unfree.cachix.org"
        "https://lexisother.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nixpkgs-unfree.cachix.org-1:hqvoInulhbV4nJ9yJOEr+4wxhDV4xq2d1DK7S6Nj6rs="
        "lexisother.cachix.org-1:/JtVjLzEue9SHlXK0O4ogtZpRpzeLqTwfZpfTIN/N2s="
      ];
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 3d";
      interval = {
        Hour = 3;
        Minute = 15;
      };
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;

      allowBroken = false;
      permittedInsecurePackages = [ "python-2.7.18.8" ];
    };
  };
}
