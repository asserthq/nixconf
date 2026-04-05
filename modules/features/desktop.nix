{ self, ... }: {
  
  flake.nixosModules.desktop = { pkgs, ... }:
  let
    selfpkgs = self.packages.${pkgs.stdenv.hostPlatform.system};
  in {
    imports = [
      self.nixosModules.gtk
      self.nixosModules.wallpaper

      self.nixosModules.pipewire
    ];

    programs.niri.enable = true;
    programs.niri.package = selfpkgs.niri;

    preferences.autostart = [selfpkgs.noctalia];

    environment.systemPackages = [
      # selfpkgs.terminal
      pkgs.pcmanfm
      selfpkgs.noctalia
      pkgs.brave
      pkgs.wl-clipboard-rs
    ];

    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      ubuntu-sans
      cm_unicode
      corefonts
      unifont
    ];

    fonts.fontconfig.defaultFonts = {
      serif = ["Ubuntu Sans"];
      sansSerif = ["Ubuntu Sans"];
      monospace = ["JetBrainsMono Nerd Font"];
    };

    time.timeZone = "Asia/Krasnoyarsk";
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "ru_RU.UTF-8";
      LC_IDENTIFICATION = "ru_RU.UTF-8";
      LC_MEASUREMENT = "ru_RU.UTF-8";
      LC_MONETARY = "ru_RU.UTF-8";
      LC_NAME = "ru_RU.UTF-8";
      LC_NUMERIC = "ru_RU.UTF-8";
      LC_PAPER = "ru_RU.UTF-8";
      LC_TELEPHONE = "ru_RU.UTF-8";
      LC_TIME = "ru_RU.UTF-8";
    };

    services.upower.enable = true;

    security.polkit.enable = true;

    hardware = {
      enableAllFirmware = true;

      bluetooth.enable = true;
      bluetooth.powerOnBoot = true;

      opengl = {
        enable = true;
        driSupport32Bit = true;
      };
    };
  };

}
