{ inputs, self, ... }: {
  
  perSystem = { pkgs, lib, self', ... }: {
    packages.niri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      settings = {
        spawn-at-startup = [
          (lib.getExe self'.packages.noctalia)
        ];
      
        input.keyboard.xkb.layout = "us, ru";

        layout = {
          gaps = 5;

          focus-ring = {
            width = 2;
            active-color = "#${self.themeNoHash.base09}";
          };
        };

        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
      
        binds = {
          "Mod+Return".spawn = lib.getExe self'.packages.alacritty;
          "Mod+Q".close-window = {};
          "Mod+S".spawn-sh = "${lib.getExe self'.packages.noctalia} ipc call launcher toggle";
        };
      };
    };
  };

}
