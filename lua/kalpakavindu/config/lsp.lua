return function()
  local cmp = require("cmp")
  local cmp_lsp = require("cmp_nvim_lsp")
  local capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    cmp_lsp.default_capabilities()
  )

  require("fidget").setup({})
  require("mason").setup({ providers = { "mason.providers.client", "mason.providers.registry-api" } })
  require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "gopls" },
    handlers = {
      function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup({
          capabilities = capabilities,
        })
      end,

      ["gopls"] = function()
        local lspconfig = require("lspconfig")
        lspconfig.gopls.setup({
          capabilities = capabilities,
          cmd = { "gopls" },
          filetypes = { "go", "gomod", "gowork", "gotmpl" },
          root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
          settings = {
            gopls = {
              completeUnimported = true,
              usePlaceholders = true,
              analyses = { unusedparams = true },
            }
          },
        })
      end,

      ["lua_ls"] = function()
        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              runtime = { version = "Lua 5.1" },
              diagnostics = {
                globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
              },
            },
          },
        })
      end,
    },
  })

  local cmp_select = { behavior = cmp.SelectBehavior.Select }

  cmp.setup({
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
      ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
      ["<C-y>"] = cmp.mapping.confirm({ select = true }),
      ["<C-Space>"] = cmp.mapping.complete(),
    }),
    sources = cmp.config.sources(
      {
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- For luasnip users.
      },
      {
        { name = "buffer" },
      }
    ),
  })

  vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    severity_sort = false,
    undate_in_insert = false,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  })
end
