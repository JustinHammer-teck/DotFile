-- return {
--   {
--     "neovim/nvim-lspconfig",
--     opts = {
--       servers = {
--         volar = {
--           filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
--           init_options = {
--             vue = {
--               hybridMode = false,
--             },
--           },
--         },
--       },
--     },
--   },
-- }

local M
local vtsls_path = vim.env.VTSLS_PATH
local Snacks = require("snacks")
local util = require("lspconfig.util")

M = {}

if vtsls_path ~= nil then
  Snacks.notifier.notify("Vtlsl Found", "info", { style = "compact", timeout = 1700, title = "Lsp Loaded" })
  M = {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          vtsls = {
            mason = false,
            cmd = { vtsls_path, "--stdio" },
            root_dir = util.root_pattern("package.json"),
            settings = {},
          },
        },
      },
    },
    {
      "stevearc/conform.nvim",
      options = true,
      opts = {
        formatters_by_ft = {
          html = { "prettierd" },
          javascript = { "prettierd" },
          javascriptreact = { "prettierd" },
          markdown = { "prettierd" },
          typescript = { "prettierd" },
          typescriptreact = { "prettierd" },
          ["*"] = { "trim_whitespace" },
        },
        formatters = {
          prettierd = {
            append_args = { "--single-quote", "--bracket-same-line" },
          },
        },
      },
    },
  }
else
  Snacks.notifier.notify("No Lsp For JS/TS Found", "info", { style = "compact", timeout = 2000, title = "Lsp Loaded" })
end

return M
