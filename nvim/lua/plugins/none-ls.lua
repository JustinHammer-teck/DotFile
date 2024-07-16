return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  lazy = true,
  config = function()
    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LSPFormatting", {})
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.csharpier,
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.mypy,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({
            group = augroup,
            buffer = bufnr,
          })
        end
      end,
    })

    vim.keymap.set("n", "<leader>lff", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "Format document" })

    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename Symbol" })
    vim.keymap.set({ "n", "i" }, "<f2>", vim.lsp.buf.rename, { desc = "Rename Symbol" })
    vim.keymap.set({ "n", "i" }, "<f12>", vim.lsp.buf.definition, { desc = "Go to Definition" })
    vim.keymap.set({ "n" }, "<leader>ld", vim.lsp.buf.definition, { desc = "Go to Definition" })
    vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
    vim.keymap.set("n", "<leader>lh", vim.lsp.buf.signature_help, { desc = "Signature Help" })
    vim.keymap.set("n", "<leader>lsR", vim.lsp.buf.references, { desc = "To to References" })
    vim.keymap.set(
      { "n" },
      "<leader>lsD",
      ":TroubleToggle document_diagnostics<CR>",
      { desc = "Toggle Document Diagnostics" }
    )
    vim.keymap.set("n", "<leader>lsI", ":TroubleToggle lsp_implementations<CR>", { desc = "Toggle LSP References" })
    vim.keymap.set("n", "<leader>lsd", ":TroubleToggle lsp_definitions<CR>", { desc = "Toggle LSP Definitions" })
  end,
}
