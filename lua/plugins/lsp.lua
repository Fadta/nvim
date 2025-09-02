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
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("ConfLspAttach", { clear = true }),
        callback = function(event)
          local client_id = event.data.client_id
          local client = vim.lsp.get_client_by_id(client_id)

          local function map(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          -- KEYMAPS
          local builtin = require("telescope.builtin")
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
            local highlight_augroup =
              vim.api.nvim_create_augroup("ConfLspHighlight", { clear = false })
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
                vim.api.nvim_clear_autocmds({ group = "conf-lsp-highlight", buffer = event2.buf })
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
      vim.diagnostic.config({ signs = { text = diagnostic_signs } })
    end,
  }, -- End of lspconfig

  --[[
--  ###### MASON ######
--]]
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ui = {
        border = "rounded",
      },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
        handlers = {
          function(server_name)
            vim.lsp.enable(server_name)
          end,
        },
      })

      vim.diagnostic.config({
        virtual_text = true,
        virtual_lines = false,
        underline = true,
      })
    end,
  },
}
