local omnisharp_path = vim.env.OMNISHARP_PATH
local csharp_ls = vim.env.CSHARP_LS
local pid = vim.fn.getpid()
local util = require("lspconfig/util")
local Snacks = require("snacks")

if omnisharp_path ~= nil then
  Snacks.notifier.notify("Omnisharp Loaded", "info", { style = "compact", timeout = 2000, title = "Lsp Loaded" })
  return {
    {
      "neovim/nvim-lspconfig",
      dependencies = {
        "Hoffs/omnisharp-extended-lsp.nvim",
      },
      opts = {
        servers = {
          omnisharp = {
            mason = false,
            cmd = { omnisharp_path, "--languageserver", "--hostPID", tostring(pid) },
            enable_decompilation_support = true,
            sdk_include_prereleases = true,
            filetypes = { "cs", "vb", "csproj", "sln", "slnx", "props", "csx", "props", "targets" },
            root_dir = util.root_pattern("*.sln", "flake.nix"),
            handlers = {
              ["textdocument/definition"] = function(...)
                return require("omnisharp_extended").handler(...)
              end,
              ["textdocument/typeDefinition"] = function(...)
                return require("omnisharp_extended").handler(...)
              end,
              ["textdocument/references"] = function(...)
                return require("omnisharp_extended").handler(...)
              end,
              ["textdocument/implementation"] = function(...)
                return require("omnisharp_extended").handler(...)
              end,
            },
            keys = {
              {
                "gr",
                function()
                  require("omnisharp_extended").telescope_lsp_references()
                end,
                desc = "[G]oto [R]eference",
              },
              {
                "gd",
                function()
                  require("omnisharp_extended").telescope_lsp_definitions()
                end,
                desc = "[G]oto [D]efinition",
              },
              {
                "gI",
                function()
                  require("omnisharp_extended").lsp_implementation()
                end,
                desc = "[G]oto [I]mplementation",
              },
              {
                "<leader>D",
                function()
                  require("omnisharp_extended").telescope_lsp_type_definition()
                end,
                desc = "Type [D]efinition",
              },
            },
            enable_roslyn_analyzers = true,
            organize_imports_on_format = true,
            enable_import_completion = true,
          },
        },
      },
    },
  }
elseif csharp_ls ~= nil then
  Snacks.notifier.notify("Csharp Ls Found", "info", { style = "compact", timeout = 2000, title = "Lsp Loaded" })
  return {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          csharp_ls = {
            mason = false,
            cmd = { "csharp-ls" },
            root_dir = util.root_pattern("*.sln", ".git", "flake.nix"),
          },
        },
      },
    },
  }
else
  Snacks.notifier.notify("No LSP For Csharp Found", "warn", { style = "compact", timeout = 2000, title = "Lsp Loaded" })
  return {}
end
