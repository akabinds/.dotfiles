require("bufferline").setup({
	options = {
		show_buffer_default_icon = true,
		always_show_bufferline = true,
		diagnostics = "nvim_lsp",
		separator_style = "",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center"
			},
		}
	}
})
