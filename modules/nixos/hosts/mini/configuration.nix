{ self, ... }: {
  
  flake.nixosModules.miniHost = { pkgs, ... }: {
    imports = [
      self.nixosModules.miniHostHardware
      
      self.nixosModules.base
      self.nixosModules.general
      self.nixosModules.cli
      self.nixosModules.desktop
      #self.nixosModules.niri

      
      self.nixosModules.telegram
      self.nixosModules.vscode

      self.nixosModules.powersave
    ];

    boot.loader = {
      systemd-boot.enable = false;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        # efiInstallAsRemovable = true;

        # dual boot
        useOSProber = true;
        default = 2;
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };

    # boot.loader.efi.efiSysMountPoint = "/boot"; # Ensure ESP is mounted here
    # boot.loader.systemd-boot.enable = false;

    networking.hostName = "mini";

    networking.networkmanager.enable = true;

    programs.niri.enable = true;
    # programs.niri.package = self.packages.${pkgs.system}.niri;

    boot.kernelPackages = pkgs.linuxPackages_latest;

    system.stateVersion = "25.11";
  };
  
}
