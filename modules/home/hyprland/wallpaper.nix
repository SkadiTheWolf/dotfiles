{pkgs, ...}: let
  wallpaper = ../../../assets/wallpapers/main.jpg;
in {
  home.packages = with pkgs; [
    hyprpaper
  ];

  xdg.configFile."hypr/hyprpaper.conf".text = ''

    monitor = DP-1
    path = ~/.config/dotfiles/assets/wallpapers/main.jpg
    fit_mode = cover

    monitor = HDMI-A-1
    path = ~/.config/dotfiles/assets/wallpapers/main.jpg
    fit_mode = cover

    monitor = DVI-D-1
    path = ~/.config/dotfiles/assets/wallpapers/main.jpg
    fit_mode = cover


  '';
}
