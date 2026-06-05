{pkgs, ...}: {
  home.packages = with pkgs; [
    kitty
    git
    git-crypt
    gnupg
    nano
    zsh
    wev

    yazi
    rofi
    papirus-icon-theme
    mako
    networkmanagerapplet

    gnome-keyring
    seahorse

    pavucontrol
    libnotify

    curl
    wget
    unzip

    file
    jq
    zoxide
    ffmpeg
    poppler
    imagemagick
    ueberzugpp
    mpv
    imv

    ripgrep
    fd
    fzf
    bat
    btop
    lazygit

    texliveFull
    texstudio

    go
    gopls
    gotools

    python3
    pyright

    direnv
    nix-direnv
    alejandra

    playerctl
    brightnessctl

    anki

    nasm

    rustup

    androidStudioPackages.dev

    eclipses.eclipse-java
    openjdk

    gdb

    codeblocks
    glib
    gtk4.dev

    vscode
    vscode-extensions.ecmel.vscode-html-css
  ];

  programs.wireshark.enable = true;
  programs.wireshark.usbmon.enable = true;

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}
