{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./neovim
  ];
  home.stateVersion = "23.11";
  home.username = "perj";
  home.homeDirectory = "/home/perj";
  home.packages = [
    pkgs.bottom
    pkgs.brave
    pkgs.firefox
    pkgs.lazygit
    pkgs.bitwarden
    #inputs.nixvim-flake.packages.${pkgs.system}.default
  ];
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.fish = {
    enable = true;
  };
  programs.kitty = {
    enable = true;
    extraConfig = builtins.readFile ./kitty.conf;
  };

  programs.home-manager.enable = true;
}
