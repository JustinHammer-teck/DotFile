---@brief
---
--- https://github.com/nix-community/nixd
---
--- Nix language server, based on nix libraries.
---
--- If you are using Nix with Flakes support, run `nix profile install github:nix-community/nixd` to install.
--- Check the repository README for more information.

---@type vim.lsp.Config
return {
  cmd = { "nixd" },
  filetypes = { "nix" },
  root_markers = { "flake.nix", ".git" },
  settings = {
    nixpkgs = {
      expr = 'import (builtins.getFlake "github:JustinHammer-teck/nix-config").inputs.nixpkgs { }',
    },
    options = {
      nix_darwin = {
        expr = '(builtins.getFlake "github:JustinHammer-teck/nix-config").darwinConfigurations.imbp.options',
      },
      imbp_home = {
        expr = '(builtins.getFlake "github:JustinHammer-teck/nix-config").darwinConfigurations.imbp.options.home-manager.users.type.getSubOptions []',
      },
      popcorn = {
        expr = '(builtins.getFlake "github:JustinHammer-teck/nix-config").nixosConfigurations.popcorn.options',
      },
      popcorn_home = {
        expr = '(builtins.getFlake "github:JustinHammer-teck/nix-config").nixosConfigurations.popcorn.options.home-manager.users.type.getSubOptions []',
      },
      xucxich = {
        expr = '(builtins.getFlake "github:JustinHammer-teck/nix-config").nixosConfigurations.xucxich.options',
      },
    },
  },
}
