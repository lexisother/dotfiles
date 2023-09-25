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

    ignores = [
      ".DS_Store"
    ];

    delta = {
      enable = true;
      options = {
        line-numbers = true;
        features = "decorations";
        syntax-theme = "ansi";
      };
    };

    extraConfig = {
      init.defaultBranch = "master";
    };
  };

  programs.gh = {
    enable = true;
    # Why the *fuck* are these packages as opposed to GitHub links???
    extensions = with pkgs; [
      gh-actions-cache
    ];
  };

  programs.gitui.enable = true;
}
