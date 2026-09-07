{pkgs, ...}: {
  home.packages = with pkgs; [
    hypridle
  ];

  xdg.configFile."hypr/hypridle.conf".text = ''
    general {
      lock_cmd = pidof hyprlock || hyprlock
      before_sleep_cmd = loginctl lock-session
      after_sleep_cmd = hyprctl dispatch dpms on
    }

    listener {
      timeout = 3600
      on-timeout = hyprlock
    }

    listener {
      timeout = 9000
      on-timeout = hyprctl dispatch dpms off
      on-resume = hyprctl dispatch dpms on
    }

    listener {
      timeout = 9600
      on-timeout = systemctl suspend
    }
  '';
}
