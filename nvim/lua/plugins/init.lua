return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = require("plugins.modules.ui.setup.lualine").otps,
    config = require("plugins.modules.ui.setup.lualine").config,
  },
  require("plugins.modules.ui.setup.colorscheme"),
  require("plugins.modules.obsidian"),
  require("plugins.lsp.omnisharp"),
  require("plugins.lsp.nil-ls"),
  require("plugins.lsp.pyright"),
  require("plugins.lsp.typescript"),
}
