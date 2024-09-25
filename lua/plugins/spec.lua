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
    "itchyny/lightline.vim",
    
    config = function()
      vim.cmd([[let g:lightline = { 'colorscheme': 'tokyonight' }]])
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
  },

  {
    "preservim/nerdtree",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    }
  },

  {
    "sindrets/Diffview.nvim",
  },

  {
    "nvim-lua/plenary.nvim",
  },

  {
    "BurntSushi/ripgrep",
  },

  {
    "nvim-telescope/telescope.nvim",
  },

  {
    "kevinhwang91/promise-async",
  }, 

  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      "neovim/nvim-lspconfig",
    },
    opts = function() 
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true
      }

      local language_servers = {
        'clangd',
        'rust_analyzer'
      }

      for _, ls in ipairs(language_servers) do
          require('lspconfig')[ls].setup({
              capabilities = capabilities
          })
      end

      vim.o.foldcolumn = '1' -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
  },
}
