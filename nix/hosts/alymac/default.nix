# hosts/YourHostName/default.nix
{ pkgs, ... }:
{
  # Make sure the nix daemon always runs
  services.nix-daemon.enable = true;
  # Installs a version of nix, that dosen't need "experimental-features = nix-command flakes" in /etc/nix/nix.conf
  # services.nix-daemon.package = pkgs.nixFlakes;
  users.users.alyxia = {
    name = "alyxia";
    home = "/Users/alyxia";
  };
  
  # if you use zsh (the default on new macOS installations),
  # you'll need to enable this so nix-darwin creates a zshrc sourcing needed environment changes
  programs.zsh.enable = true;
  # bash is enabled by default
  # enable the gpg agent by default
  programs.gnupg.agent.enable = true;

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
    };
    casks = [
      "discord"
    ];
  };
}
