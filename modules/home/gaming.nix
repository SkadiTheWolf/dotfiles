{pkgs, ...}: {

    # Config for Steam
    programs.steam = {
      enable = true;
    };
    services.resolved.enable = true;

  # For Lutris
    hardware.graphics.enable32Bit = true;


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
