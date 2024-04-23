local nil_path = vim.env.NIL_PATH

if nil_path ~= nil then
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
else
  return {}
end
