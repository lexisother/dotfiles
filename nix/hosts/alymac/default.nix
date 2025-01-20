{
  system.stateVersion = 5;

  networking = {
    computerName = "Alyxia's MacBook Pro";
    hostName = "alymac";
    localHostName = "alymac";
  };

  # enable the gpg agent by default
  programs.gnupg.agent.enable = true;

  # if you use zsh (the default on new macOS installations),
  # you'll need to enable this so nix-darwin creates a zshrc sourcing needed environment changes
  programs.zsh.enable = true;

  # tailscaled isn't automatically registered as a service that should run on installation.
  services.tailscale.enable = true;

  # set nixpkgs system
  nixpkgs.hostPlatform = "x86_64-darwin";
}
