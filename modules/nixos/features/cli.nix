{ self, ... }: {

  flake.nixosModules.cli = { pkgs, lib, ... }:
  let
    selfpkgs = self.packages.${pkgs.stdenv.hostPlatform.system};
  in {
    environment.sessionVariables = {
      EDITOR = lib.getExe selfpkgs.helix;
      VISUAL = lib.getExe selfpkgs.helix;
    };
    
    environment.systemPackages = [
      pkgs.file
      pkgs.unzip
      pkgs.zip
      pkgs.p7zip
      pkgs.wget
      pkgs.killall
      pkgs.fzf
      pkgs.yazi
      pkgs.eza
      pkgs.fd
      pkgs.zoxide
      pkgs.dust
      pkgs.ripgrep
      pkgs.fastfetch
      pkgs.libqalculate
      pkgs.lazygit

      # wrapped
      selfpkgs.git
      selfpkgs.helix
      selfpkgs.alacritty
      # self'.packages.neovimDynamic
      # self'.packages.qalc
      # self'.packages.lf
      # self'.packages.jujutsu
      # self'.packages.jjui
      # self'.packages.nix-check-bin
    ];
  };

}
