{ config, lib, ... }:
{
  options.everforest = {
    enable = lib.mkEnableOption "Everforest";

    variant = lib.mkOption {
      default = "dark";
      description = "Everforest variant";
      example = "light";
      type = lib.types.enum [
        "dark"
        "light"
      ];
    };

    flavour = lib.mkOption {
      default = "medium";
      description = "Everforest flavour";
      example = "hard";
      type = lib.types.enum [
        "hard"
        "medium"
        "soft"
      ];
    };
  };

  config = lib.mkIf config.everforest.enable {
    lib.everforest.palette = import ./../../palettes/${config.everforest.variant}/${config.everforest.flavour}.nix;

    programs.nixvim = {
      colorschemes.everforest = {
        enable = true;
        settings.background = config.everforest.flavour;
      };

      opts.background = config.everforest.variant;
    };
  };
}
