local default_srv = { "nixd", "lua_ls", "just", "vtsls" }

return {
  {
    "neovim/nvim-lspconfig",
  },
  vim.lsp.enable(default_srv),
}
