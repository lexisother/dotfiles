{ dotfiles, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull; # contains git send-email et al

    userName = "Alyxia Sother";
    userEmail = "alyxia@riseup.net";

    signing = {
      key = "01E16C4E775A37E4";
      signByDefault = true;
    };

    delta.enable = true;
  };

  programs.gitui.enable = true;
}
