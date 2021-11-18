local lsp_status = require('lsp-status')
local lsp_installer_servers = require 'nvim-lsp-installer.servers'
local remaps = require('lua/lsp/remaps')
local presentCmpNvimLsp, cmpNvimLsp = pcall(require, 'cmp_nvim_lsp')

local function on_attach(client, bufnr)
    remaps.set_default(client, bufnr)
    lsp_status.on_attach(client, bufnr)

    -- adds beatiful icon to completion
    require'lspkind'.init()

    -- add signature autocompletion while typing
    require'lsp_signature'.on_attach({
        floating_window = false,
        timer_interval = 500
    })
end

local servers = {
    efm = require('lua/lsp/servers/efm')(),
    tsserver = require('lua/lsp/servers/tsserver')(on_attach),
    pyright = require('lua/lsp/servers/pyright')(on_attach),
    pylsp = require('lua/lsp/servers/pylsp')(on_attach),
}

-- extensibility for autocomplete
local capabilities = {};

capabilities = vim.tbl_extend('keep', capabilities, lsp_status.capabilities)

if presentCmpNvimLsp then
    capabilities = vim.tbl_extend('keep', capabilities,
                                  cmpNvimLsp.update_capabilities(
                                      vim.lsp.protocol
                                          .make_client_capabilities()))
end

local default_lsp_config = {on_attach = on_attach, capabilities}
for serverName, config in pairs(servers) do
    local ok, server = lsp_installer_servers.get_server(serverName)
    if ok then
        if not server:is_installed() then
            print('installing ' .. serverName)
            server:install()
        end
    end

    server:setup(vim.tbl_deep_extend('force', default_lsp_config, config))
    vim.cmd [[ do User LspAttachBuffers ]]
end