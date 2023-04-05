local colorscheme = 'tokyonight'
pcall(require, 'imxyz.colors.' .. colorscheme)
local success, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not success then
	vim.notify("Cannot set colorscheme '" .. colorscheme .. "'; not found!")
	return
end