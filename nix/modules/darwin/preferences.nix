{
  system.defaults = {
    ActivityMonitor = {
      IconType = 5;
      OpenMainWindow = true;
      SortColumn = "CPUUsage";
      SortDirection = 0;
    };

    NSGlobalDomain = {
      NSDocumentSaveNewDocumentsToCloud = false;
      NSNavPanelExpandedStateForSaveMode = true;
      NSNavPanelExpandedStateForSaveMode2 = true;

      KeyRepeat = 6;
      InitialKeyRepeat = 25;
    };

    LaunchServices.LSQuarantine = false;

    finder = {
      AppleShowAllFiles = true;
      AppleShowAllExtensions = true;
      ShowPathbar = true;
      _FXShowPosixPathInTitle = true;
    };

    universalaccess = {
      closeViewScrollWheelToggle = true;
    };

    CustomSystemPreferences = {
      "com.apple.desktopservices" = {
        # Don't create .DS_STORE files on network or external stores
        DSDontWriteNetworkStores = true;
        DSDontWriteUSBStores = true;
      };
      "com.apple.appstore" = {
        WebKitDeveloperExtras = true;
        ShowDebugMenu = true;
      };
      # Exists in system.defaults, but it's just one option...
      "com.apple.SoftwareUpdate" = {
        AutomaticCheckEnabled = true;
        ScheduleFrequency = 1;
        AutomaticDownload = 1;
        CriticalUpdateInstall = 1;
      };
      "com.apple.commerce".AutoUpdate = true;

      "org.x.X11".enable_test_extensions = true;
    };
  };
}
