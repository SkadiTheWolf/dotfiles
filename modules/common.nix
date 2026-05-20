{
  config,
  pkgs,
  inputs,
  ...
}: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.greetd = {
    enable = false;
    settings = {
      default_session = {
        command = "Hyprland";
        user = "skadi";
      };
    };
  };
  services.desktopManager.plasma6.enable = true;

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];

  services.printing.enable = true;
  services.printing.drivers = with pkgs; [
    epson-escpr
    gutenprint
  ];

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  hardware.sane.enable = true;
  hardware.sane.extraBackends = with pkgs; [epkowa];
  services.ipp-usb.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.skadi = {
    isNormalUser = true;
    description = "skadi";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [kdePackages.kate];
  };

  programs.firefox.enable = true;

  xdg.mime.defaultApplications = {
    "text/html" = "vivaldi";
    "x-scheme-handler/http" = "vivaldi-stable.desktop";
    "x-scheme-handler/https" = "vivaldi-stable.desktop";
    "x-scheme-handler/about" = "org.vivaldi-stable.desktop";
    "x-scheme-handler/unknown" = "org.vivaldi-stable.desktop";
  };

  fonts.packages = with pkgs; [
    powerline-fonts
    nerd-fonts.meslo-lg
    font-awesome
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    bitwarden-desktop
    signal-desktop
    libreoffice-qt
    discord
    tor-browser
    vivaldi
    vivaldi-ffmpeg-codecs
    nextcloud-client
    gimp
    v4l-utils
    guvcview
    spotify
    gparted
    hyprpolkitagent
    atuin
    easyeffects
    cliphist
    lazygit
    bat
    inputs.unstable.legacyPackages.x86_64-linux.nix-sweep
    fastfetch
    zotero
  ];

  system.stateVersion = "25.11";
}
