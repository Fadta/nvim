return {
  {
    "folke/lazydev.nvim", -- Better integration of luals for neovim configuration
    lazy = true,
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "Saghen/blink.cmp",
      "artemave/workspace-diagnostics.nvim"
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("ConfLspAttach", { clear = true }),
        callback = function(event)
          local client_id = event.data.client_id
          local bufnr = event.buf
          local client = vim.lsp.get_client_by_id(client_id)
          local builtin = require("telescope.builtin")

          -- Workspace diagnostics
          for _, client_lsp in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
            require('workspace-diagnostics').populate_workspace_diagnostics(client_lsp, bufnr)
          end

          local function map(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          -- KEYMAPS
          map("gd", builtin.lsp_definitions, "[G]oto [d]efinition")
          map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
          map("gr", builtin.lsp_references, "[G]oto [r]eferences under cursor")
          map("gI", builtin.lsp_implementations, "[G]oto [I]mplementations")
          map("<leader>lws", builtin.lsp_workspace_symbols, "[w]orkspace [s]ymbols")
          map("<leader>lds", builtin.lsp_document_symbols, "[d]ocument [s]ymbols")
          map("<leader>lf", vim.lsp.buf.format, "[f]ormat")
          map("<leader>lr", vim.lsp.buf.rename, "[r]ename")
          map("<leader>la", vim.lsp.buf.code_action, "Code [a]ction")

          -- autocomplete
          --[[if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client_id, event.buf, { autotrigger = true })
          end
          vim.cmd[[set completeopt+=noselect]]
          --]]

          -- AUTOCOMMANDS on attach
          if
              client
              and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight)
          then
            local highlight_augroup = vim.api.nvim_create_augroup("conf-lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
              group = vim.api.nvim_create_augroup("ConfLspDetach", { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({ group = highlight_augroup, buffer = event2.buf })
              end,
            })
          end
        end, -- END OF CALLBACK
      })

      local signs = { ERROR = "", WARN = "", INFO = "", HINT = "" }
      local diagnostic_signs = {}
      for type, icon in pairs(signs) do
        diagnostic_signs[vim.diagnostic.severity[type]] = icon
      end
      vim.diagnostic.config({
        signs = { text = diagnostic_signs },
        virtual_text = false,
        virtual_lines = true,
        underline = true,
      })
    end,
  }, -- End of lspconfig

  --[[
--  ###### MASON ######
--]]
  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ui = {
        border = "rounded",
      },
      -- ensure_installed = require('language_services').get_lsp_list(),
      -- ensure_installed is delegated to bootstrapper.lua

    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
}
