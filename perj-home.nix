{config, pkgs, ...}:

{
home.stateVersion = "23.11";
home.username = "perj";
home.homeDirectory = "/home/perj";
home.packages = with pkgs; [
 # bottom
 # lazygit
];
#programs.direnv.enable = true;
#  programs.direnv.nix-direnv.enable = true;
  }
