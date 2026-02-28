{ config, ... }:
{
  programs.fzf = {
    colors = with config.lib.everforest.palette; {
      fg = fg;
      "fg+" = fg;
      bg = bg2;
      "bg+" = bg4;
      hl = green;
      "hl+" = red;
      marker = blue;
      prompt = orange;
      spinner = yellow;
      pointer = fg;
      border = grey1;
      separator = bg4;
      query = fg;
      header = blue;
      info = grey0;
    };
  };
}
