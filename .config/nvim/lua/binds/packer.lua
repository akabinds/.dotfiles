vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use) 
    use "wbthomason/packer.nvim"

    use {
		"nvim-telescope/telescope.nvim", tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" } },
		config = function() 
			require("telescope").load_extension("lazygit")
		end,
    }

    use {
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons" }
    }

	use {
		"akinsho/bufferline.nvim", tag = "v3.*",
		requires = { "nvim-tree/nvim-web-devicons" }
	}

	use {
		"nvim-tree/nvim-tree.lua",
		requires = { "nvim-tree/nvim-web-devicons" }
	}

    use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate"
    }

	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}

	use "Pocco81/true-zen.nvim"
    use "nvim-treesitter/playground"
    use "tpope/vim-commentary"
    use "tpope/vim-surround"
    use "ap/vim-css-color"
    use "rafi/awesome-vim-colorschemes"
    use "terryma/vim-multiple-cursors"
    use "itmammoth/doorboy.vim"
    use "theprimeagen/harpoon"
    use "mbbill/undotree"
	use "preservim/tagbar"
	use "folke/tokyonight.nvim"
	use "Pocco81/auto-save.nvim"
end)
