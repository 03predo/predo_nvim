local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
        PACKER_BOOTSTRAP = fn.system({
                "git",
                "clone",
                "--depth",
                "1",
                "https://github.com/wbthomason/packer.nvim",
                install_path,
        })
        print("Installing packer close and reopen Neovim...")
        vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
        return
end

-- Have packer use a popup window
packer.init({
        display = {
                open_fn = function()
                        return require("packer.util").float({ border = "rounded" })
                end,
        },
})

-- Install your plugins here
return packer.startup(function(use)
    use ("wbthomason/packer.nvim") -- Have packer manage itself

    use("folke/tokyonight.nvim")
    use("nvim-treesitter/nvim-treesitter")
    use("nvim-lua/plenary.nvim")
    use("BurntSushi/ripgrep")
    use("nvim-telescope/telescope.nvim")
    use("sindrets/Diffview.nvim")
    use("preservim/nerdtree")
    use("kevinhwang91/promise-async")
    use("kevinhwang91/nvim-ufo")

    vim.o.foldcolumn = '1' -- '0' is not bad
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    if PACKER_BOOTSTRAP then
      require("packer").sync()
    else
      require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
            return {'treesitter', 'indent'}
        end
      })
      vim.cmd [[colorscheme tokyonight-night]]
    end
end)

