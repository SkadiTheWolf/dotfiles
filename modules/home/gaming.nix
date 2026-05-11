{pkgs, ...}: {

  home.packages = with pkgs; [
    prismlauncher
    lutris
    mangohud
    goverlay
    mumble
    protonup-qt
    vulcan-tools
  ];
}
