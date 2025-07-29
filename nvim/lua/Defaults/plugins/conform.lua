return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			-- TODO Add prettier
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
				html = { "prettier" },
				htmldjango = { "prettier" },
				javascript = { "prettier" },
			},

			format_on_save = {
				fallback = true,
				async = false,
				timeout_ms = 2000,
			},
		})
	end,
}
