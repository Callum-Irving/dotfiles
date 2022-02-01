local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  PackerBootstrap = fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd('packadd packer.nvim')

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Appearance
  use 'Callum-Irving/gruvbox'
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  -- use 'lukas-reineke/indent-blankline.nvim'
  use 'norcalli/nvim-colorizer.lua'

  -- Completion / LSP
  use 'neovim/nvim-lspconfig'
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip'
    }
  }
  use 'hrsh7th/vim-vsnip'
  use 'rafamadriz/friendly-snippets'
  use 'onsails/lspkind-nvim'
  use 'ray-x/lsp_signature.nvim'
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }

  -- Other
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'
  use 'sbdchd/neoformat'

  -- File navigation
  -- use {'junegunn/fzf', run = function() vim.fn['fzf#install']() end}
  -- use 'junegunn/fzf.vim'

  use { 'ibhagwan/fzf-lua', requires = { 'kyazdani42/nvim-web-devicons' } }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- Todo comment stuff
  use {
    'folke/todo-comments.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'folke/trouble.nvim'
    }
  }
  
  -- Git
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  -- use 'tpope/vim-fugitive'


  use 'vimwiki/vimwiki'

  -- Automatically sync if installed for first time
  if PackerBootstrap then
    require('packer').sync()
  end
end)

-- Possibly useful future plugins:
-- 'alvan/vim-closetag'
-- 'preservim/nerdcommenter'
-- 'akinsho/toggleterm.nvim'

