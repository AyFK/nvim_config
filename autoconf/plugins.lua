-- src : https://github.com/LunarVim/Neovim-from-scratch/tree/03-plugins

local fn = vim.fn

-- automatically install packer
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

-- reload neovim whenever plugins.lua file is saved
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- use a protected call for initial use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end


-- install plugins here
return packer.startup(function(use)
    -- packer manage
    use "wbthomason/packer.nvim"

    -- lsp
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig"

    -- cmp plugins
    use "hrsh7th/nvim-cmp"    -- completion pluggin
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "hrsh7th/cmp-nvim-lsp"

    -- treesitter (syntax highlighting)
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }


    -- colorscheme
    use "rktjmp/lush.nvim" -- needed for jellybeans
    use "metalelf0/jellybeans-nvim"

    -- vimtex
    use "lervag/vimtex"

    -- gitsigns
    use "lewis6991/gitsigns.nvim"

    -- automatically set up your configuration after cloning packer.nvim
    -- put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
