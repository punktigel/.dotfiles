-- lsp configuration

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "pyright" },
})

local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),         -- Choose next suggestion
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),       -- Choose previous suggestion
        ["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Accept first suggestion
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
    },
})


-- --------------------------------------------------
-- LSP config
local lspconfig = require("lspconfig")
local default_capabilities = require("cmp_nvim_lsp").default_capabilities()


-- Setup defaults for all lsp
vim.lsp.config('*', {
    capabilities = default_capabilities,
    on_attach = function(_, bufnr)
        -- Optional Keymaps
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    end,
})


-- lua_ls
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
        },
    },
})


-- --------------------------------------------------
-- LSP diagnostics
vim.diagnostic.config({
    virtual_text = {
    prefix = "●",
  },
})

