{ inputs, self, ... }: {
  
  perSystem = { pkgs, lib, self', ... }: {
    packages.niri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      settings = {
        spawn-at-startup = [
          (lib.getExe self'.packages.noctalia)
        ];
      
        input = {
          keyboard.xkb.layout = "us, ru";

          touchpad = {
            natural-scroll = {};
            tap = {};
          };

          focus-follows-mouse = {};
        };
        
        layout = {
          gaps = 5;

          focus-ring = {
            width = 2;
            active-color = "#${self.themeNoHash.base09}";
          };

          preset-column-widths = [
            { proportion = 1.0 / 3.0; }
            { proportion = 1.0 / 2.0; }
            { proportion = 2.0 / 3.0; }
          ];
          default-column-width = {
            proportion = 1.0 / 2.0;
          };
        };

        
        workspaces = let
          settings = {
            layout.gaps = 5;
          };
        in {
          "w0" = settings;
          "w1" = settings;
          "w2" = settings;
          "w3" = settings;
          "w4" = settings;
          "w5" = settings;
          "w6" = settings;
          "w7" = settings;
          "w8" = settings;
          "w9" = settings;
        };
      
        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
      
        binds = {
          "Mod+Return".spawn = lib.getExe self'.packages.alacritty;
          
          "Mod+Q".close-window = {};
          "Mod+F".maximize-column = {};
          "Mod+G".fullscreen-window = {};
          "Mod+Shift+F".toggle-window-floating = {};
          "Mod+C".center-column = {};          

          "Mod+Tab".toggle-overview = {};
          "Mod+S".spawn-sh = "${lib.getExe self'.packages.noctalia} ipc call launcher toggle";

          "Mod+H".focus-column-left = {};
          "Mod+L".focus-column-right ={};
          "Mod+K".focus-window-up = {};
          "Mod+J".focus-window-down = {};
        
          "Mod+Left".focus-column-left = {};
          "Mod+Right".focus-column-right = {};
          "Mod+Up".focus-window-up = {};
          "Mod+Down".focus-window-down = {};

          "Mod+WheelScrollDown".focus-column-left = {};
          "Mod+WheelScrollUp".focus-column-right = {};

          "Mod+BracketLeft".consume-or-expel-window-left = {};
          "Mod+BracketRight".consume-or-expel-window-right = {};
          "Mod+Comma".consume-window-into-column = {};
          "Mod+Period".expel-window-from-column = {};
          "Mod+R".switch-preset-column-width = {};         
          
          "Mod+1".focus-workspace = "w0";
          "Mod+2".focus-workspace = "w1";
          "Mod+3".focus-workspace = "w2";
          "Mod+4".focus-workspace = "w3";
          "Mod+5".focus-workspace = "w4";
          "Mod+6".focus-workspace = "w5";
          "Mod+7".focus-workspace = "w6";
          "Mod+8".focus-workspace = "w7";
          "Mod+9".focus-workspace = "w8";
          "Mod+0".focus-workspace = "w9";
          
          "Mod+Shift+H".move-column-left = {};
          "Mod+Shift+L".move-column-right = {};
          "Mod+Shift+K".move-window-up = {};
          "Mod+Shift+J".move-window-down = {};
          
          # "Mod+Ctrl+Page_Down".move-column-to-workspace-down = {};
          # "Mod+Ctrl+Page_Up".move-column-to-workspace-up = {};
          "Mod+Shift+U".move-column-to-workspace-down = {};
          "Mod+Shift+I".move-column-to-workspace-up = {};       

          "Mod+Shift+1".move-column-to-workspace = "w0";
          "Mod+Shift+2".move-column-to-workspace = "w1";
          "Mod+Shift+3".move-column-to-workspace = "w2";
          "Mod+Shift+4".move-column-to-workspace = "w3";
          "Mod+Shift+5".move-column-to-workspace = "w4";
          "Mod+Shift+6".move-column-to-workspace = "w5";
          "Mod+Shift+7".move-column-to-workspace = "w6";
          "Mod+Shift+8".move-column-to-workspace = "w7";
          "Mod+Shift+9".move-column-to-workspace = "w8";
          "Mod+Shift+0".move-column-to-workspace = "w9";

          "Mod+Ctrl+H".set-column-width = "-5%";
          "Mod+Ctrl+L".set-column-width = "+5%";
          "Mod+Ctrl+J".set-window-height = "-5%";
          "Mod+Ctrl+K".set-window-height = "+5%";

          "Mod+Ctrl+WheelScrollDown".focus-workspace-down = {};
          "Mod+Ctrl+WheelScrollUp".focus-workspace-up = {};

          "XF86AudioRaiseVolume".spawn-sh = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+";
          "XF86AudioLowerVolume".spawn-sh = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-";
          "XF86AudioMute".spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "XF86AudioMicMute".spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";          
          "XF86MonBrightnessUp".spawn = ["brightnessctl" "--class=backlight" "set" "+10%"];
          "XF86MonBrightnessDown".spawn = ["brightnessctl" "--class=backlight" "set" "-10%"];
                    
          # extra group
          "Mod+Shift+E".quit = {};
          "Mod+Shift+Slash".show-hotkey-overlay = {};
          # "Mod+Shift+R".load-config-file = {};
        };
      };
    };
  };

}
