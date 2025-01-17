{ pkgs, ... }:
{
  users.users.alyxia = {
    name = "alyxia";
    home = if pkgs.stdenv.hostPlatform.isDarwin then "/Users/alyxia" else "/home/alyxia";
  };
}
