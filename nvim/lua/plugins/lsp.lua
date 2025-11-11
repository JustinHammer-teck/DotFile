local default_srv = { "nixd", "lua_ls", "just" }

return {
  {
    "neovim/nvim-lspconfig",
  },
  vim.lsp.enable(default_srv),
}
