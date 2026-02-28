# everforest-nix

🌲 Nix port of the [Everforest](https://github.com/sainnhe/everforest) color scheme by [@sainnhe](https://github.com/sainnhe).

## Support

- [x] [alacritty](https://github.com/alacritty/alacritty)
- [x] [fzf](https://github.com/junegunn/fzf)
- [x] [nixvim](https://github.com/nix-community/nixvim)
- [x] [tmux](https://github.com/tmux/tmux)

## Installation

<details>

<summary>NixOS</summary>

### NixOS

1. Add this repository to your flake inputs.
2. Import the module in your Home Manager configuration.

```nix
{
  description = "NixOS configuration of Jane Doe";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    everforest.url = "github:BinaryAlien/everforest-nix"; # <--------------- (1)
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      everforest,
      ...
    }:
    {
      nixosConfigurations = {
        hostname = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager

            # ...

            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.jdoe.imports = [
                ./home.nix
                everforest.homeModules.everforest # <----------------------- (2)
                # ...
              ];
            }
          ];
        };
      };
    };
}
```

</details>

<details>

<summary>nix-darwin</summary>

### nix-darwin

1. Add this repository to your flake inputs.
2. Import the module in your Home Manager configuration.

```nix
{
  description = "nix-darwin configuration of Jane Doe";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    everforest.url = "github:BinaryAlien/everforest-nix"; # <--------------- (1)
  };

  outputs =
    {
      nixpkgs,
      nix-darwin,
      home-manager,
      everforest,
      ...
    }:
    {
      darwinConfigurations = {
        hostname = nix-darwin.lib.darwinSystem {
          system = "x86_64-linux";
          modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager

            # ...

            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.jdoe.imports = [
                ./home.nix
                everforest.homeModules.everforest # <----------------------- (2)
                # ...
              ];
            }

          ];
        };
      };
    };
}
```

</details>

<details>

<summary>Standalone</summary>

### Standalone

1. Add this repository to your flake inputs.
2. Import the module in your Home Manager configuration.

```nix
{
  description = "Home Manager configuration of Jane Doe";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    everforest.url = "github:BinaryAlien/everforest-nix"; # <--------------- (1)
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      everforest,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations.jdoe = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./home.nix
          everforest.homeModules.everforest # <----------------------------- (2)
          # ...
        ];
      };
    };
}
```

</details>

## Usage

### Home Manager

Enable the palette of your choice.

```nix
{ config, pkgs, ... }:

{
  home.username = "jdoe";
  home.homeDirectory = "/home/jdoe";

  # ...

  everforest = {
    enable = true;
    flavour = "hard";
    variant = "dark";
  };

  # ...
}
```

The following example demonstrates how to:

1. Access the hexadecimal color codes through `config.lib.everforest.palette`.
2. Access the flavour through `config.everforest.flavour`.
3. Access the variant through `config.everforest.variant`.

```nix
{ config, pkgs, ... }:

{
  home.username = "jdoe";
  home.homeDirectory = "/home/jdoe";

  # ...

  # vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv (1)
  programs.tmux.extraConfig = with config.lib.everforest.palette; ''
    set-option -g copy-mode-selection-style     "bg=${bg_visual}"
    set-option -g menu-selected-style           "bg=${statusline1},fg=${bg0}"
    # ...
  '';
  # ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ (1)

  programs.nixvim = {
    colorschemes.everforest.settings = {
      background = config.everforest.flavour; # <--------------------------- (2)
    };

    opts = {
      background = config.everforest.variant; # <--------------------------- (3)
    };
  };

  # ...
}
```
