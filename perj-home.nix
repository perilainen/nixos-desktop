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
    ./hypr
    ./waybar.nix
  ];
  home.stateVersion = "23.11";
  home.username = "perj";
  home.homeDirectory = "/home/perj";
  home.packages = with pkgs; [
    bottom
    brave
    google-chrome
    hyprcursor
    firefox
    lazygit
    bitwarden
    pavucontrol
    cider
    # cider-2
    mpd
    # cider
    hyprpicker
    swayidle
    wlogout
    gcc
    mpv
    # bluez
    kubectl
    vim
    # yazi
    nil
    nh
    manix
    comma
    devenv
    nyxt
    noto-fonts
    nerd-fonts.fira-code
    nerd-fonts.iosevka-term-slab
    nerd-fonts.symbols-only
    font-awesome
    # noto-fonts-cjk-sans
    # noto-fonts-emoji
    # liberation_ttf
    # fira-code
    # fira-code-symbols
    # mplus-outline-fonts.githubRelease
    # dina-font
    # proggyfonts

    # nodejs_21
    #inputs.nixvim-flake.packages.${pkgs.system}.default
  ];
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.whitesur-cursors;
    name = "WhiteSur-cursors";
    size = 16;
  };

  gtk = {
    enable = true;
    # theme = {
    #   package = pkgs.flat-remix-gtk;
    #   name = "Flat-Remix-GTK-Grey-Darkest";
    # };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };
  fonts.fontconfig.enable = true;
  # wayland.windowManager.hyprland.enable = true;
  programs.kodi.enable = true;
  # programs.waybar = {
  #   enable = true;
  #   settings = [
  #     {
  #       position = "bottom";
  #     }
  #   ];
  # };
  programs.navi = {
    enable = true;
  };
  programs.helix = {
    enable = true;
    settings.keys.normal.K = "hover";
    settings.theme = "base16";
    settings.keys.normal.esc = ["collapse_selection" "keep_primary_selection"];
    themes = {
      base16 = let
        transparent = "none";
        gray = "#665c54";
        dark-gray = "#3c3836";
        white = "#fbf1c7";
        black = "#282828";
        red = "#fb4934";
        green = "#b8bb26";
        yellow = "#fabd2f";
        orange = "#fe8019";
        blue = "#83a598";
        magenta = "#d3869b";
        cyan = "#8ec07c";
      in {
        "ui.menu" = transparent;
        "ui.menu.selected" = {modifiers = ["reversed"];};
        "ui.linenr" = {
          fg = gray;
          bg = dark-gray;
        };
        "ui.popup" = {modifiers = ["reversed"];};
        "ui.linenr.selected" = {
          fg = white;
          bg = black;
          modifiers = ["bold"];
        };
        "ui.selection" = {
          fg = black;
          bg = blue;
        };
        "ui.selection.primary" = {modifiers = ["reversed"];};
        "comment" = {fg = gray;};
        "ui.statusline" = {
          fg = white;
          bg = dark-gray;
        };
        "ui.statusline.inactive" = {
          fg = dark-gray;
          bg = white;
        };
        "ui.help" = {
          fg = dark-gray;
          bg = white;
        };
        "ui.cursor" = {modifiers = ["reversed"];};
        "variable" = red;
        "variable.builtin" = orange;
        "constant.numeric" = orange;
        "constant" = orange;
        "attributes" = yellow;
        "type" = yellow;
        "ui.cursor.match" = {
          fg = yellow;
          modifiers = ["underlined"];
        };
        "string" = green;
        "variable.other.member" = red;
        "constant.character.escape" = cyan;
        "function" = blue;
        "constructor" = blue;
        "special" = blue;
        "keyword" = magenta;
        "label" = magenta;
        "namespace" = blue;
        "diff.plus" = green;
        "diff.delta" = yellow;
        "diff.minus" = red;
        "diagnostic" = {modifiers = ["underlined"];};
        "ui.gutter" = {bg = black;};
        "info" = blue;
        "hint" = dark-gray;
        "debug" = dark-gray;
        "warning" = yellow;
        "error" = red;
      };
    };
  };

  # programs.yazi = {
  #   enable = true;
  #   enableFishIntegration = true;
  #
  #   settings.manager.show_hidden = true;
  #
  #   #   theme = "catppuccin";
  #   #
  # };
  programs.k9s = {
    enable = true;
    # settings = {
    #   k9s = {
    #     clusters = {
    #       app.aurora = {
    #         namespace = {
    #           active = "undertext";
    #         };
    #       };
    #
    #       defaultNamespace = "svt";
    #       dev.aurora = {
    #         namespace = {
    #           active = "undertext";
    #         };
    #       };
    #     };
    #   };
    # };
    hotkey = {
      hotKey = {
        shift-1 = {
          shortCut = "Shift-1";
          description = "Switch to context app";
          command = "context app.aurora";
        };
      };
    };
  };
  programs.git = {
    lfs.enable = true;
    enable = true;
    userName = "Per Johansson";
    userEmail = "per.a.johansson@svt.se";
    aliases = {
      ap = "add --patch";
    };
    extraConfig = {
      url."git@git.svt.se:".insteadOf = "https://git.svt.se/";
      url."git@github.com:".insteadOf = "https://github.com/";
      init = {
        defaultBranch = "main";
      };
      pull = {
        rebase = true;
      };
      fetch.prune = true;
      rebase.autostash = true;
    };
  };

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      vscodevim.vim
      yzhang.markdown-all-in-one
      # esp
    ];
  };
  programs.autojump = {
    enable = true;
  };
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "xterm-256color";

        # font = "Fira Code:size=11";
        dpi-aware = "yes";
      };

      mouse = {
        hide-when-typing = "yes";
      };
      colors = {
        foreground = "cdd6f4"; # Text
        background = "1e1e2e"; # Base
        regular0 = "45475a"; # Surface 1
        regular1 = "f38ba8"; # red
        regular2 = "a6e3a1"; # green
        regular3 = "f9e2af"; # yellow
        regular4 = "89b4fa"; # blue
        regular5 = "f5c2e7"; # pink
        regular6 = "94e2d5"; # teal
        regular7 = "bac2de"; # Subtext 1
        bright0 = "585b70"; # Surface 2
        bright1 = "f38ba8"; # red
        bright2 = "a6e3a1"; # green
        bright3 = "f9e2af"; # yellow
        bright4 = "89b4fa"; # blue
        bright5 = "f5c2e7"; # pink
        bright6 = "94e2d5"; # teal
        bright7 = "a6adc8"; # Subtext 0
      };
    };
  };
  # foreground=cdd6f4 # Text
  # background=1e1e2e # Base
  # regular0=45475a   # Surface 1
  # regular1=f38ba8   # red
  # regular2=a6e3a1   # green
  # regular3=f9e2af   # yellow
  # regular4=89b4fa   # blue
  # regular5=f5c2e7   # pink
  # regular6=94e2d5   # teal
  # regular7=bac2de   # Subtext 1
  # bright0=585b70    # Surface 2
  # bright1=f38ba8    # red
  # bright2=a6e3a1    # green
  # bright3=f9e2af    # yellow
  # bright4=89b4fa    # blue
  # bright5=f5c2e7    # pink
  # bright6=94e2d5    # teal
  # bright7=a6adc8    # Subtext 0
  # };
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.wofi = {
    enable = true;
    settings = {
      allow-images = true;
    };
    style = ''
      window {
      margin: 0px;
      border: 1px solid #88c0d0;
      background-color: #2e3440;
      }

      #input {
      margin: 5px;
      border: none;
      color: #d8dee9;
      background-color: #3b4252;
      }

      #inner-box {
      margin: 5px;
      border: none;
      background-color: #2e3440;
      }

      #outer-box {
      margin: 5px;
      border: none;
      background-color: #2e3440;
      }

      #scroll {
      margin: 0px;
      border: none;
      }

      #text {
      margin: 5px;
      border: none;
      color: #d8dee9;
      }

      #entry:selected {
      background-color: #3b4252;
      }
    '';
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      vpnsvt = "sudo openconnect --useragent=AnyConnect --user=pejo03 asavpn.svt.se/svtvpn";
      vpnnps = "sudo openconnect --useragent=AnyConnect --user= pejo03 asavpn.svt.se/NPStest";
    };
    shellAbbrs = {
      g = "git";
      n = "nvim";
    };
  };
  programs.kitty = {
    enable = true;
    extraConfig = builtins.readFile ./kitty.conf;
  };

  programs.home-manager.enable = true;
}
