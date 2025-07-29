return {
	"mfussenegger/nvim-lint",

	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local lint = require("lint")
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		lint.linters_by_ft = {
			-- python = { "ruff" },
		}

		local cmd = vim.api.nvim_create_autocmd
		cmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,

	-- enabled = false,
}
