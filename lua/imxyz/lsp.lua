local success, mason_lspconfig = pcall(require, "mason-lspconfig")
if not success then
	vim.api.nvim_err_writeln('Cannot setup mason-lspconfig, not found!')
	return
end

local success, lspconfig = pcall(require, "lspconfig")
if not success then
	vim.api.nvim_err_writeln('Cannot setup lspconfig, not found!')
	return
end

mason_lspconfig.setup({
	ensure_installed = {
		"lua_ls", "rust_analyzer", "pylsp"
	},
	automatic_installation = true,
})

-- Setup border for lsp floating windows
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization

local border = {
	{"╭", "FloatBorder"},
	{"─", "FloatBorder"},
	{"╮", "FloatBorder"},
	{"│", "FloatBorder"},
	{"╯", "FloatBorder"},
	{"─", "FloatBorder"},
	{"╰", "FloatBorder"},
	{"│", "FloatBorder"},
}

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
	keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
	keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
	keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
	keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
	keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

local opts = {
	on_attach = function(client, bufnr)
		lsp_keymaps(bufnr)
		local status_ok, illuminate = pcall(require, "illuminate")
		if not status_ok then
			illuminate.on_attach(client)
		end
	end,
	handlers = {
		["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
		["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
	}
}

lspconfig.lua_ls.setup(vim.tbl_deep_extend('force', opts, { settings = {
	Lua = {
		runtime = {
			version = 'LuaJIT',
		},
		diagnostics = {
			globals = {'vim'},
		},
		workspace = {
			library = vim.api.nvim_get_runtime_file("", true),
		},
		telemetry = {
			enable = false,
		},
	},
}}))

lspconfig.clangd.setup(opts);
lspconfig.pylsp.setup(opts);
lspconfig.rust_analyzer.setup(opts)