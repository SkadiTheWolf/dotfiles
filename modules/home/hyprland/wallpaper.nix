{pkgs, ...}: let
  wallpaper = ../../../assets/wallpapers/main.jpg;
in {
  home.packages = with pkgs; [
    hyprpaper
  ];

  xdg.configFile."hypr/hyprpaper.conf".text = ''

    monitor =
    path = ~/.config/dotfiles/assets/wallpapers/main.jpg
    fit_mode = cover

  '';
}
