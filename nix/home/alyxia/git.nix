{ pkgs, ... }:

{
  programs = {
    git = {
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
          navigate = true;
          line-numbers = true;
          features = "decorations";

          decorations = {
            commit-decoration-style = "bold yellow box ul";
            file-style = "bold yellow ul";
            file-decoration-style = "none";
            hunk-header-decoration-style = "yellow box";
          };
        };
      };

      extraConfig = {
        init.defaultBranch = "master";
      };
    };

    gh = {
      enable = true;
      # Why the *fuck* are these packages as opposed to GitHub links???
      extensions = with pkgs; [
        gh-actions-cache
      ];
    };

    gitui.enable = true;
  };
}
