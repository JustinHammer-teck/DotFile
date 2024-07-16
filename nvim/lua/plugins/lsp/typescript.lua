return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        volar = {
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
          init_options = {
            vue = {
              hybridMode = false,
            },
            -- typescript = {
            -- tsdk = os.getenv("HOME") .. "/.nvm/versions/node/v20.12.0/lib/node_modules/typescript/lib",
            -- },
          },
        },
      },
    },
  },
}
