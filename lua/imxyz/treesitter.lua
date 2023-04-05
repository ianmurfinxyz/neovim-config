local success, treesitter = pcall(require, "nvim-treesitter.configs")
if not success then
	vim.api.nvim_err_writeln("Cannot setup treesitter, not found!")
	return
end

treesitter.setup({
	ensure_installed = { "lua", "python", "rust", "c", "cpp", "vimdoc" },
	sync_install = false,
	auto_install = true,
	ignore_install = { "javascript" },
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},
})