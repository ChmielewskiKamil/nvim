function ColorMyPencils(color)
	color = color or "nightfly"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", {bg = "None"})
	vim.api.nvim_set_hl(0, "NormalFloat", {bg = "None"})

end

ColorMyPencils()
