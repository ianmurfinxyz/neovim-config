local new_packer_install = (function()
	local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	local packer_not_installed = vim.fn.empty(vim.fn.glob(install_path)) > 0
	if packer_not_installed then
		print("Packer not installed, running first time setup")
		print(vim.fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path}))
		PACKER_BOOTSTRAP = 1
		vim.cmd [[packadd packer.nvim]]
	end
	return PACKER_BOOTSTRAP == 1
end)()

local success, packer = pcall(require, "packer")
if not success then
	print("Packer not installed, cannot setup plugins!")
	return false
end

vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost setup_plugins.lua source <afile> | PackerSync
	augroup end
]]

packer.init {
	display = {
		open_fn = function()
			return require('packer.util').float {border = 'rounded'}
		end
	}
}

packer.startup(function(use)
	use { 'wbthomason/packer.nvim' }
	use { 'nvim-lua/popup.nvim' }
	use { "nvim-lua/plenary.nvim" }
	use { 'nvim-treesitter/nvim-treesitter' }
	use { 'williamboman/mason.nvim' }
	use { 'williamboman/mason-lspconfig.nvim' }
	use { 'neovim/nvim-lspconfig' }
	use { 'RRethy/vim-illuminate' }
	use { 'folke/tokyonight.nvim' }
	if new_packer_install then
		require("packer").sync()
	end
end)

return new_packer_install