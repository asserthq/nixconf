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
      # nix
      # pkgs.nil
      # pkgs.nixd
      # pkgs.statix
      # pkgs.alejandra
      # pkgs.manix
      # pkgs.nix-inspect
      # self'.packages.nh

      # other
      pkgs.file
      pkgs.unzip
      pkgs.zip
      pkgs.p7zip
      pkgs.wget
      pkgs.killall
      # pkgs.sshfs
      pkgs.fzf
      # pkgs.htop
      # pkgs.btop
      pkgs.eza
      pkgs.fd
      pkgs.zoxide
      pkgs.dust
      pkgs.ripgrep
      pkgs.fastfetch
      # pkgs.tree-sitter
      # pkgs.imagemagick
      # pkgs.imv
      # pkgs.ffmpeg-full
      # pkgs.yt-dlp
      pkgs.lazygit

      # wrapped
      # self'.packages.neovimDynamic
      # self'.packages.qalc
      # self'.packages.lf
      selfpkgs.git
      # self'.packages.jujutsu
      # self'.packages.jjui
      # self'.packages.nix-check-bin

      # sandbox
      pkgs.libqalculate
      pkgs.yazi
      selfpkgs.helix
      selfpkgs.alacritty
    ];
  };

}
