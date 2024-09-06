return {
  -- the colorscheme should be available when starting Neovim
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  {
    "preservim/nerdtree",
    lazy = false,
  },

  {
    "sindrets/Diffview.nvim",
    lazy = false,
  },

  {
    "nvim-lua/plenary.nvim",
    lazy = false,
  },

  {
    "BurntSushi/ripgrep",
    lazy = false,
  },

  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
  }, 

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
  },

  {
    "neoclide/coc.nvim",
    branch = "release",
    lazy = false,
  },

  {
    "kevinhwang91/promise-async",
    lazy = false,
  },

  {
    "kevinhwang91/nvim-ufo",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "kevinhwang91/promise-async",
    },
    opts = function()
      vim.o.foldcolumn = '1' -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      return {
        provider_selector = function(bufnr, filetype, buftype)
          return {'treesitter', 'indent'}
        end,
      }
    end,       
  },

}
