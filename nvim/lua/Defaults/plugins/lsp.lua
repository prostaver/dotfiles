return {
	"mason-org/mason-lspconfig.nvim",

	dependencies = {
		"mason-org/mason.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		{ "hrsh7th/nvim-cmp", event = "InsertEnter" },
		"j-hui/fidget.nvim",
	},

	config = function()
		require("fidget").setup({
			-- integration = {
			-- 	["nvim_lsp"] = true,
			-- },
		})

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
			},
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		-- vim.lsp.config("*", {
		-- 	capabilities = capabilities,
		-- })

		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
		vim.lsp.config("pylsp", {
			capabilities = capabilities,
			settings = {
				pylsp = {
					plugins = {
						mccabe = { enabled = false },
						pycodestyle = { enabled = false },
						pyflakes = { enabled = false },
						pylint = { enabled = false },
					},
				},
			},
		})
		vim.lsp.config("jinja_lsp", {
			capabilities = capabilities,
			filetypes = { "htmldjango", "jinja" },
		})

		-- vim.lsp.enable("ruff", false)

		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
				["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
			}, {
				{ name = "buffer" },
			}),
		})

		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
			virtual_text = true,
		})
	end,
}
