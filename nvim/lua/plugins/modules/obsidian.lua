local M = {}

local Obsidian = {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "Vault",
        path = "$HOME/paranote",
      },
    },
    -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
    completion = {
      -- Set to false to disable completion.
      nvim_cmp = false,
      -- Trigger completion at 2 chars.
      min_chars = 1,
    },

    -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
    -- way then set 'mappings = {}'.
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      -- Smart action depending on context, either follow link or toggle checkbox.
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    }, -- see below for full list of options 👇
  },
}

Obsidian.config = function(_, opts)
  require("obsidian").setup(opts)

  -- HACK: fix error, disable completion.nvim_cmp option, manually register sources
  local cmp = require("cmp")
  cmp.register_source("obsidian", require("cmp_obsidian").new())
  cmp.register_source("obsidian_new", require("cmp_obsidian_new").new())
  cmp.register_source("obsidian_tags", require("cmp_obsidian_tags").new())
end

local Blink = {
  "saghen/blink.cmp",
  dependencies = { "saghen/blink.compat" },
  opts = {
    sources = {
      default = { "obsidian", "obsidian_new", "obsidian_tags" },
      providers = {
        obsidian = {
          name = "obsidian",
          module = "blink.compat.source",
        },
        obsidian_new = {
          name = "obsidian_new",
          module = "blink.compat.source",
        },
        obsidian_tags = {
          name = "obsidian_tags",
          module = "blink.compat.source",
        },
      },
    },
  },
}

M = {
  Obsidian,
  Blink,
  {
    "folke/zen-mode.nvim",
    opts = {
      plugins = {
        twilight = { enabled = true }, -- this will change the font size on wezterm when in zen mode
        -- See alse also the Plugins/Wezterm section in this projects README
        wezterm = {
          enabled = false,
          -- can be either an absolute font size or the number of incremental steps
          font = "+2", -- (10% increase per step)
        },
      },
    },
  },
}

return M
