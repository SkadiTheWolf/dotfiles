{pkgs, ...}: {
  home.packages = [
    (pkgs.writeShellScriptBin "scratchpad-toggle" ''
      if hyprctl clients | grep -q "class: scratchpad"; then
        hyprctl dispatch togglespecialworkspace scratchpad
      else
        kitty --class scratchpad --title scratchpad
      fi
    '')
  ];
}
