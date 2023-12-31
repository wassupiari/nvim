local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim"    -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"  -- Useful lua functions used ny lots of plugins

    -- theme
    use { 'ribru17/bamboo.nvim' }

    -- cmp plugins
    use "hrsh7th/nvim-cmp"         -- The completion plugin
    use "hrsh7th/cmp-buffer"       -- buffer completions
    use "hrsh7th/cmp-path"         -- path completions
    use "hrsh7th/cmp-cmdline"      -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions

    -- snippets
    use "L3MON4D3/LuaSnip"             --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    use { "junegunn/fzf", run = "fzf#install()" }
    -- LSP
    use {
        "neovim/nvim-lspconfig",
        wants = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim"
        },
        requires = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim"
        }, config = function()
        require('plugins/lsp')
    end,
    }

    -- Telescope
   use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
      "nvim-telescope/telescope-project.nvim",
    },
    config = function()
      require("plugins.telescope")
    end,
  }

  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  }

  use {
    "paopaol/telescope-git-diffs.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
  }

    -- Treesitter
    use {
        -- Nvim Treesitter configurations and abstraction layer
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        requires = {
            "windwp/nvim-ts-autotag",
            "p00f/nvim-ts-rainbow"
        },
        config = function()
            require('plugins/treesitter')
        end,
    }

    -- nvim-tree
    use {
        "nvim-tree/nvim-tree.lua",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require('plugins/nvim-tree')
        end,
    }

    -- autopairs
    use "windwp/nvim-autopairs"

    -- comment
    use "numToStr/Comment.nvim"
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- buffline
    use "akinsho/bufferline.nvim"
    use "moll/vim-bbye"

    -- lualine
    use 'nvim-lualine/lualine.nvim'

    -- dash
    use 'goolord/alpha-nvim'
    use "antoinemadec/FixCursorHold.nvim"

    -- markdown
    use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
    })


    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
