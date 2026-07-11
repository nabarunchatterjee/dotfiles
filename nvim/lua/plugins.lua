local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'jose-elias-alvarez/null-ls.nvim',
  'MunifTanjim/prettier.nvim',
  'JoosepAlviste/nvim-ts-context-commentstring',
  -- 'jose-elias-alvarez/typescript.nvim',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  'vimwiki/vimwiki',
  -- 'tools-life/taskwiki',
  { 'numToStr/Comment.nvim',  opts = {} },
  { 'windwp/nvim-autopairs',  opts = {} },
  { 'kylechui/nvim-surround', opts = {} },
  {
    'nvim-tree/nvim-tree.lua',
    opts = {
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
    },
    actions = {
      change_dir = {
        enable = true,
        global = true,
      },
    },
  },
  { "iamcco/markdown-preview.nvim",     run = function() vim.fn["mkdp#util#install"]() end, },
  -- Bufferline
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        numbers = 'buffer_id',
      }
    }
  },
  { "benfowler/telescope-luasnip.nvim", module = "telescope._extensions.luasnip" },
  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
  },
  -- Autocompletion Engine
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
      "L3MON4D3/LuaSnip",         -- Snippet engine (required for auto-imports)
      "saadparwaiz1/cmp_luasnip", -- Snippet source for nvim-cmp
    },
  },
  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',        opts = {} },

  { 'ishan9299/nvim-solarized-lua' },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      -- indent = { char = '┊' },
      indent = { char = '&' },
    },
  },

  -- nvim in firefox
  { 'glacambre/firenvim',            build = ":call firenvim#install(0)" },


  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',         opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x',                   dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
  { 'airblade/vim-rooter' },

  { import = 'custom.plugins' },
}, {})
