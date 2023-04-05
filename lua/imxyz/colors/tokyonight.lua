require("tokyonight").setup({
	style = "storm",
	light_style = "day",
	transparent = false,
	terminal_colors = true,
	styles = {
		comments = { italic = true },
		keywords = { italic = false },
		functions = {},
		variables = {},
		sidebars = "dark",
		floats = "dark",
	},
	sidebars = { "qf", "vista_kind", "terminal", "packer" },
	day_brightness = 0.3,
	hide_inactive_statusline = false, 
	dim_inactive = false,
	lualine_bold = false,
	on_colors = function(colors)
		colors.bg_dark = "#0f0f0f"
		colors.bg = "#121212"
	end,
})