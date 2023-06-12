{ pkgs, ... }:

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

    delta = {
      enable = true;
      options = {
        line-numbers = true;
        features = "decorations";
        syntax-theme = "ansi";
      };
    };

    extraConfig = {
      tag.gpgsign = true;
      init.defaultBranch = "master";
    };
  };

  programs.gitui.enable = true;
}
