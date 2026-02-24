{
  description = "Comfortable & Pleasant Color Scheme for Nix";

  outputs = inputs: {
    homeModules = rec {
      everforest = import ./modules/home-manager;
      default = everforest;
    };
  };
}
