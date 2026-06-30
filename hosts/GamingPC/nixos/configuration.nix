{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../../modules/common.nix
  ];

  networking.hostName = "GamingPC"; # Define your hostname.

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  console.keyMap = "de";

  programs.thunderbird.enable = true;

  programs.zsh.enable = true;

  users.users.skadi.shell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    kitty
    rofi
    yazi
    waybar
    hyprpaper
    mako
    networkmanagerapplet
    git
    vim
    wget
    neovim
    wl-clipboard
    grim
    slurp
  ];

  # Config for Steam
  programs.steam = {
    enable = true;
  };
  services.resolved.enable = true;

  # For Lutris
  hardware.graphics.enable32Bit = true;

  system.stateVersion = "26.05"; # Did you read the comment?
}
