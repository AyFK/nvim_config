
-- Ensure lspconfig is available
local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

-- Define the LSP servers to use
local servers = {
    "pyright",
    "clangd",
}

-- Mason setup
local mason_status_ok, mason = pcall(require, "mason")
if mason_status_ok then
    mason.setup()
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if mason_lspconfig_status_ok then
    mason_lspconfig.setup({
        ensure_installed = servers,
        automatic_installation = true,
    })
end

-- LSP Keybindings (on_attach function)
local function on_attach(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- Keybindings for LSP actions
    local keymap = vim.keymap.set
    keymap("n", "gd", vim.lsp.buf.definition, opts)
    keymap("n", "K", vim.lsp.buf.hover, opts)
    keymap("n", "gi", vim.lsp.buf.implementation, opts)
    keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
    keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    keymap("n", "gr", vim.lsp.buf.references, opts)
    keymap("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
    end, opts)
end

-- Capabilities for nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_nvim_lsp_status_ok then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

-- Setup each server
for _, server in ipairs(servers) do
    lspconfig[server].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

-- nvim-cmp Configuration
local cmp_status_ok, cmp = pcall(require, "cmp")
if cmp_status_ok then
    cmp.setup({
        -- Display cmp window with sources, variables, functions, etc.
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
        }, {
            { name = "buffer" },
        }),

        -- Keybindings for navigating the cmp window
        mapping = cmp.mapping.preset.insert({
            ["<C-k>"] = cmp.mapping.scroll_docs(-4),            -- Scroll up in description window
            ["<C-j>"] = cmp.mapping.scroll_docs(4),             -- Scroll down in description window
            ["<C-c>"] = cmp.mapping.abort(),                    -- Exit cmp window
            ["<Tab>"] = cmp.mapping.select_next_item(),         -- Select next item
            ["<S-Tab>"] = cmp.mapping.select_prev_item(),       -- Select previous item
            ["<CR>"] = cmp.mapping.confirm({ select = true }),  -- Confirm selection
        }),
    })
end

-- Diagnostics configuration
vim.diagnostic.config({
    virtual_text = {
        prefix = " ", -- Reserve space for diagnostic symbols
        spacing = 2,   -- Adjust spacing between text and virtual text
    },
    signs = true,       -- Keep the diagnostic signs in the sign column
    underline = true,   -- Underline problematic code
    update_in_insert = false, -- Update diagnostics only in Normal mode
})

-- Ensure the sign column is always visible
vim.o.signcolumn = "yes"







local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
  ensure_installed = { "python", "cpp", "lua" },  -- add your desired languages
  sync_install = false,
  highlight = {
    enable = true,  -- enable Tree-sitter highlighting
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },
  indent = { enable = true, disable = { "" } },
})

