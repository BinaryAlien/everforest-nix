{ config, ... }:
{
  programs.alacritty = {
    settings.colors =
      with config.lib.everforest.palette;
      let
        black = if config.everforest.variant == "light" then bg3 else fg;
        white = if config.everforest.variant == "light" then fg else bg3;
      in
      {
        primary = {
          background = bg0;
          foreground = fg;
        };

        normal = {
          black = black;
          red = red;
          green = green;
          yellow = yellow;
          blue = blue;
          magenta = purple;
          cyan = aqua;
          white = white;
        };

        bright = {
          black = black;
          red = red;
          green = green;
          yellow = yellow;
          blue = blue;
          magenta = purple;
          cyan = aqua;
          white = white;
        };

        selection = {
          background = bg_visual;
          text = fg;
        };

        search = {
          matches = {
            background = green;
            foreground = bg0;
          };

          focused_match = {
            background = red;
            foreground = bg0;
          };
        };
      };
  };
}
