return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      format = {
        filter = function(client, bufnr)
          -- If eslint is attached (meaning it found a config), prefer it
          local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "eslint" })
          if #clients > 0 then
            return client.name == "eslint"
          end
          -- Otherwise fall through to other formatters
          return true
        end,
      },
    },
  },
}
