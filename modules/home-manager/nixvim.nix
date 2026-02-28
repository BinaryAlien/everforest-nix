{ config, ... }:
{
  programs.nixvim = {
    colorschemes.everforest = {
      enable = true;
      settings.background = config.everforest.flavour;
    };

    opts.background = config.everforest.variant;
  };
}
