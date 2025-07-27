return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = require("plugins.modules.ui.setup.lualine").otps,
    config = require("plugins.modules.ui.setup.lualine").config,
  },

  require("plugins.modules.ui.setup.colorscheme"),
  require("plugins.modules.ui.setup.dressing"),
  require("plugins.modules.ui.render-markdown"),

  require("plugins.lsp.csharp"),
  require("plugins.lsp.nix-lsp"),
  require("plugins.lsp.typescript"),
  require("plugins.lsp.python"),
  require("plugins.modules.dabbod"),

  vim.lsp.enable("ty"),
  vim.lsp.enable("ruff"),
}
