{pkgs, ...}: let
  wallpaper = ../../../assets/wallpapers/main.jpg;
in {
  home.packages = with pkgs; [
    hyprpaper
  ];

  xdg.configFile."hypr/hyprpaper.conf".text = ''

    wallpaper {
        monitor = DP-1
        path = ~/.dotfiles/assets/wallpapers/main.jpg
        fit_mode = cover
    }

    wallpaper {
        monitor = HDMI-A-1
        path = ~/.dotfiles/assets/wallpapers/main.jpg
        fit_mode = cover
    }

    wallpaper {
        monitor = DVI-D-1
        path = ~/.dotfiles/assets/wallpapers/main.jpg
        fit_mode = cover
    }

    wallpaper {
      monitor = DP-2
      path = ~/.dotfiles/assets/wallpapers/main.jpg
     fit_mode = cover
    }


    wallpaper {
      monitor =
      path = ~/.dotfiles/assets/wallpapers/main.jpg
      fit_mode = cover
    }

  '';
}
