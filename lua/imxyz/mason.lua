local success, mason = pcall(require, 'mason')
if not success then
	vim.api.nvim_err_writeln('Cannot setup Mason; not found!')
	return
end

mason.setup({
	ui = {
		check_outdated_packages_on_open = true,
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	},
	max_concurrent_installers = 4,
})