local nil_path = vim.env.NIL_PATH
local nixd_path = vim.env.NIXD_PATH
local Snacks = require("snacks")

if nil_path ~= nil then
  Snacks.notifier.notify("Nil Loaded", "info", { style = "compact", timeout = 2000, title = "Lsp Loaded" })
  return {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          nil_ls = {
            mason = false,
            cmd = { nil_path },
            filetypes = { "nix" },
            root_dir = function()
              local lspconfig = require("lspconfig")

              lspconfig.util.root_pattern("flake.nix", ".git")
            end,
          },
        },
      },
    },
  }
elseif nixd_path ~= nil then
  Snacks.notifier.notify("Nixd Loaded", "info", { style = "compact", timeout = 2000, title = "Lsp Loaded" })

  local nix_flake = '(builtins.getFlake "github:JustinHammer-teck/nix-config")'
  local nix_darwin_options = nix_flake .. ".darwinConfigurations.imbp.options"

  return {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          nixd = {
            mason = false,
            cmd = { nixd_path },
            filetypes = { "nix" },
            settings = {
              nixd = {
                nixpkgs = {
                  expr = "import" .. nix_flake .. ".inputs.nixpkgs",
                },
                formatting = {
                  command = { "nixfmt" },
                },
                options = {
                  nix_darwin = {
                    expr = nix_darwin_options,
                  },
                  home_manager = {
                    expr = nix_darwin_options .. ".home-manager.users.options",
                  },
                },
              },
            },
            root_dir = function()
              local lspconfig = require("lspconfig")

              lspconfig.util.root_pattern("flake.nix", ".git")
            end,
          },
        },
      },
    },
  }
else
  Snacks.notifier.notify("No Nix Lsp found", "info", { style = "compact", timeout = 2000, title = "Lsp Loaded" })
  return {}
end
