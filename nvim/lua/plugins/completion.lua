local M = {}
--- NOTE: Specify the trigger character(s) used for luasnip
M = {
  "saghen/blink.cmp",
  dependencies = {
    { "L3MON4D3/LuaSnip", version = "v2.*" },
    "saghen/blink.compat",
  },
  version = "v1.7.0",
  opts = {
    keymap = {
      preset = "enter",
      ["<CR>"] = { "accept", "fallback" },
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<C-k>"] = { "scroll_documentation_up", "fallback" },
      ["<C-j>"] = { "scroll_documentation_down", "fallback" },
      ["<C-e>"] = { "hide" },
      ["K"] = { "show", "show_documentation", "hide_documentation" },
    },

    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- Will be removed in a future release
      use_nvim_cmp_as_default = false,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = "mono",
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    snippets = { preset = "default" },
  },
  opts_extend = { "sources.default" },
}

M.opts.cmdline = {
  keymap = { preset = 'inherit' },
  completion = { menu = { auto_show = true } },
}

M.opts.completion = {
  ghost_text = { enabled = true },
  documentation = {
    auto_show = true,
    auto_show_delay_ms = 250,
    treesitter_highlighting = false,
  },
  trigger = {
    show_on_keyword = true,
  },
  accept = { auto_brackets = { enabled = true } },
  list = { selection = {
    preselect = false,
    auto_insert = true,
  } },
}

M.opts.signature = { enabled = true }

-- Default list of enabled providers defined so that you can extend it
-- elsewhere in your config, without redefining it, due to `opts_extend`
M.opts.sources = {
  default = { "lsp", "path", "snippets", "buffer", "markdown" },
  per_filetype = {
    sql = { "dadbod" },
  },
}

M.opts.sources.providers = {
  lsp = {
    name = "LSP",
    module = "blink.cmp.sources.lsp",
    -- Filter text items from the LSP provider, since we have the buffer provider for that
    -- Function to transform the items before they're returned
    transform_items = function(_, items)
      for _, item in ipairs(items) do
        if item.kind == require("blink.cmp.types").CompletionItemKind.Snippet then
          item.score_offset = item.score_offset - 3
        end
      end

      return vim.tbl_filter(function(item)
        return item.kind ~= require("blink.cmp.types").CompletionItemKind.Text
      end, items)
    end,

    --- NOTE: All of these options may be functions to get dynamic behavior
    --- See the type definitions for more information
    enabled = true, -- Whether or not to enable the provider
    async = false, -- Whether we should wait for the provider to return before showing the completions
    timeout_ms = 1250, -- How long to wait for the provider to return before showing completions and treating it as asynchronous
    should_show_items = true, -- Whether or not to show the items
    max_items = nil, -- Maximum number of items to display in the menu
    min_keyword_length = 0, -- Minimum number of characters in the keyword to trigger the provider
    -- If this provider returns 0 items, it will fallback to these providers.
    -- If multiple providers falback to the same provider, all of the providers must return 0 items for it to fallback
    fallbacks = { "buffer" },
    score_offset = 0, -- Boost/penalize the score of the items
    override = nil, -- Override the source's functions
  },

  path = {
    name = "Path",
    module = "blink.cmp.sources.path",
    score_offset = 3,
    fallbacks = { "buffer" },
    opts = {
      trailing_slash = true,
      label_trailing_slash = true,
      get_cwd = function(context)
        return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
      end,
      show_hidden_files_by_default = false,
    },
  },

  snippets = {
    name = "Snippets",
    module = "blink.cmp.sources.snippets",

    -- For `snippets.preset == 'default'`
    opts = {
      friendly_snippets = true,
      search_paths = { vim.fn.stdpath("config") .. "/snippets" },
      global_snippets = { "all" },
      extended_filetypes = {},
      ignored_filetypes = {},
      get_filetype = function(context)
        return vim.bo.filetype
      end,
      -- Set to '+' to use the system clipboard, or '"' to use the unnamed register
      clipboard_register = nil,
    },

    -- For `snippets.preset == 'luasnip'`
    -- opts = {
    --   -- Whether to use show_condition for filtering snippets
    --   use_show_condition = false,
    --   -- Whether to show autosnippets in the completion list
    --   show_autosnippets = true,
    -- },
    --
    -- -- For `snippets.preset == 'mini_snippets'`
    -- opts = {
    --   -- Whether to use a cache for completion items
    --   use_items_cache = true,
    -- }
  },

  buffer = {
    name = "Buffer",
    module = "blink.cmp.sources.buffer",
    opts = {
      -- default to all visible buffers
      get_bufnrs = function()
        return vim
          .iter(vim.api.nvim_list_wins())
          :map(function(win)
            return vim.api.nvim_win_get_buf(win)
          end)
          :filter(function(buf)
            return vim.bo[buf].buftype ~= "nofile"
          end)
          :totable()
      end,
    },
  },

  markdown = {
    name = "RenderMarkdown",
    module = "render-markdown.integ.blink",
    fallbacks = { "lsp" },
  },
}

return M
