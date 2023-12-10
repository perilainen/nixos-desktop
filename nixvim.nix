{inputs, config, pkgs, ...};

{
imports = [
inputs.nixvim.homeManagerModules.nixvim
];
programs.nixvim= {
enable = true;
options = {
  number = true;
  };
  };
  }
