local bufferline = require("bufferline")

bufferline.setup {
	options = {
		diagnostics = "nvim_lsp",
		color_icons = true,
		separator_style = "slant",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center"
			}
		}
	}
}
