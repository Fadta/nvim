local remaps = require 'lsp/remaps'

return function(on_attach)
  return{
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)

      remaps.set_typescript(client, bufnr)

      -- tsserver don't mess with prettier
      client.resolved_capabilities.document_formatting = false
    end
  }
end
