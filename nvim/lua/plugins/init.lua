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
  require("plugins.modules.obsidian"),

  require("plugins.lsp.csharp"),
  require("plugins.lsp.nix-lsp"),
  require("plugins.lsp.pyright"),
  require("plugins.lsp.typescript"),
  require("plugins.lsp.dabbod"),
}
