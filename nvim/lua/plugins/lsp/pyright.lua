return {
  {
    "neovim/nvim-lspconfig",

    opts = {
      servers = {
        pyright = {
          mason = false,
          cmd = "pyright --threads 4",
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
      },
    },
  },
}
