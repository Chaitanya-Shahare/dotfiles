
" #################################################################################
" ##################               PLUGINS                #########################
" #################################################################################

call plug#begin()

" Utility
	" Plug 'christoomey/vim-tmux-navigator'
		 " Plug 'sheerun/vim-polyglot'
		 " Plug 'itchyny/lightline.vim'
		 Plug 'nvim-lualine/lualine.nvim'
		 Plug 'tpope/vim-commentary'
		 Plug 'tpope/vim-surround'
		 Plug 'alvan/vim-closetag'
		 Plug 'lukas-reineke/indent-blankline.nvim'
		 Plug 'ekickx/clipboard-image.nvim'
		 Plug 'img-paste-devs/img-paste.vim' 
		 "https://github.com/img-paste-devs/img-paste.vim
		 Plug 'psliwka/vim-smoothie'
		 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
		 Plug 'scrooloose/NERDTree'
		 Plug 'ryanoasis/vim-devicons'
		 Plug 'neoclide/coc.nvim', {'branch': 'release'}
		 Plug 'ap/vim-css-color'
		 Plug 'jiangmiao/auto-pairs'
		 Plug 'vimwiki/vimwiki'
		 " Plug 'tools-life/taskwiki'
		 Plug 'godlygeek/tabular'
		 Plug 'preservim/vim-markdown'
		 Plug 'tpope/vim-fugitive'
		 Plug 'lewis6991/gitsigns.nvim'
		 Plug 'NTBBloodbath/color-converter.nvim'
		 Plug 'nvim-lua/plenary.nvim'
		 Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
		 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
		 Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': 'markdown' }
		 Plug 'akinsho/toggleterm.nvim'
		 Plug 'mbbill/undotree'
		 Plug 'github/copilot.vim'
		 Plug 'folke/zen-mode.nvim'
		 Plug 'nvim-tree/nvim-tree.lua'
		 Plug 'nvim-tree/nvim-web-devicons'
		 Plug 'folke/todo-comments.nvim'
		 " Colorschemes
		 Plug 'EdenEast/nightfox.nvim'
		 Plug 'rebelot/kanagawa.nvim'
		 Plug 'dracula/vim'
		 Plug 'morhetz/gruvbox'
		 Plug 'catppuccin/nvim'
		 Plug 'rose-pine/neovim'
		 Plug 'nanotech/jellybeans.vim'
		 Plug 'Chaitanya-Shahare/welcome.nvim'

		 call plug#end()





" #################################################################################
" ##################            BASIC SETTINGS              #######################
" #################################################################################

set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
set number
set relativenumber
set nowrap
set cursorline
" set cursorcolumn
set clipboard=unnamedplus
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set mouse=a
set splitright
set splitbelow
set noshowmode
" set listchars=tab:\|\ 
" set list


colo kanagawa-dragon

" highlight Normal guibg=none
" highlight NonText guibg=none
" highlight Normal ctermbg=none
" highlight NonText ctermbg=none
" au ColorScheme * hi Normal ctermbg=none guibg=none

" text folding
" autocmd BufWinLeave *.* silent mkview
" autocmd BufWinEnter *.* silent loadview

" autocmd BufWritePre * silent Format
autocmd BufWritePre ~/Documents/Barosa/* silent :Format
" autocmd BufWritePre ~/Documents/* silent :Format
autocmd BufWritePre ~/Documents/WebDev/* silent :Format
autocmd BufWritePre ~/Documents/barosa2/* silent :Format
autocmd BufWritePre ~/Documents/Zalco/* silent :Format
" autocmd BufWritePre ~/Documents/* silent :Format

lua << EOF
vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
EOF


" #################################################################################
" ##################               REMAPS                 #########################
" #################################################################################

let mapleader = " "
" imap jj <C-{>
" cmap jj <C-{>
" tnoremap jj <C-\><C-N>

nnoremap <f3> :w <CR>

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
if &filetype == 'c'
 exec "!gcc % -o %<"
 exec "!time ./%<"
elseif &filetype == 'cpp'
 exec "!g++ % -o %<"
 exec "!time ./%<"
elseif &filetype == 'java'
 exec "!javac %"
elseif &filetype == 'js'
 exec "!node %"
 exec "!time java -cp %:p:h %:t:r"
elseif &filetype == 'sh'
 exec "!time bash %"
elseif &filetype == 'python'
 exec "!time python3 %"
elseif &filetype == 'html'
 exec "!firefox % &"
elseif &filetype == 'go'
 exec "!go build %<"
 exec "!time go run %"
elseif &filetype == 'mkd'
 exec "!~/.vim/markdown.pl % > %.html &"
 exec "!firefox %.html &"
endif
endfunc

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


nnoremap <f3> :w <CR>
nnoremap <leader>w :w!<CR>

" Lazygit
" nnoremap <C-\> :LazyGit<CR>

nnoremap <C-p> :FZF<CR>
nnoremap <C-n> :NvimTreeToggle<CR>

autocmd Filetype markdown source ~/.config/nvim/scripts/markdown.vim


lua << EOF
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- For pasting without loosing the copied text
vim.keymap.set("x", "<leader>p", "\"_dp")
EOF

" Zen-mode
nnoremap <leader>z :ZenMode<CR>


" lightline -----------------------------------------------------------------------
" let g:lightline = {
 " \ 'separator': { 'left': '', 'right': '' },
 " \ 'subseparator': { 'left': '', 'right': '' }
 " \ }
 " let g:lightline = {
			 " \ 'colorscheme': 'carbonfox',
			 " \ 'background': 'dark',
			 " \ 'component_function': {
			 " \   'gitbranch': 'FugitiveHead'
			 " \ },
			 " \ 'active': {
			 " \   'left': [ [ 'mode', 'paste' ],
			 " \             [ 'filename', 'modified', 'gitbranch', 'readonly'] ]
			 " \ },
			 " \ 'separator': { 'left': '', 'right': '' },
			 " \ 'subseparator': { 'left': '', 'right': '' }
			 " \ }





" lualine -----------------------------------------------------------------------
lua << EOF
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},

    lualine_b = {'branch', 'diff', 'diagnostics'},
    -- lualine_c = {'filename'},
		lualine_c = {
			{
					'filename',
					file_status = true,      -- Displays file status (readonly status, modified status)
					newfile_status = false,  -- Display new file status (new file means no write after created)
					path = 1,                -- 0: Just the filename
					-- 1: Relative path
					-- 2: Absolute path
					-- 3: Absolute path, with tilde as the home directory
					-- 4: Filename and parent dir, with tilde as the home directory

					shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
					-- for other components. (terrible name, any suggestions?)
					symbols = {
						modified = '[+]',      -- Text to show when the file is modified.
						readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
						unnamed = '[No Name]', -- Text to show for unnamed buffers.
						newfile = '[New]',     -- Text to show for newly created file before first write
					}
					}
			},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    -- lualine_c = {'filename', path=1},
		lualine_c = {
			{
					'filename',
					file_status = true,      -- Displays file status (readonly status, modified status)
					newfile_status = false,  -- Display new file status (new file means no write after created)
					path = 1,                -- 0: Just the filename
					-- 1: Relative path
					-- 2: Absolute path
					-- 3: Absolute path, with tilde as the home directory
					-- 4: Filename and parent dir, with tilde as the home directory

					shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
					-- for other components. (terrible name, any suggestions?)
					symbols = {
						modified = '[+]',      -- Text to show when the file is modified.
						readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
						unnamed = '[No Name]', -- Text to show for unnamed buffers.
						newfile = '[New]',     -- Text to show for newly created file before first write
					}
					}
			},

    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
EOF

" coc -----------------------------------------------------------------------------
source $HOME/.config/nvim/plug-config/coc.vim
autocmd FileType css setl iskeyword+=-

" vim-closetag --------------------------------------------------------------------
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*js'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml,javascript'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx,javascript'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
	 \ 'typescript.tsx': 'jsxRegion,tsxRegion',
	 \ 'javascript.jsx': 'jsxRegion',
	 \ 'typescriptreact': 'jsxRegion,tsxRegion',
	 \ 'javascriptreact': 'jsxRegion',
	 \ }

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

" vim-markdown --------------------------------------------------------------------
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal_code_blocks = 0

 " vimwiki
 let g:vimwiki_list = [{'path': '~/Documents/vimwiki/',
			 \ 'syntax': 'markdown', 'ext': '.md'}]

 " disable table mappings
 let g:vimwiki_key_mappings = {
			 \ 'all_maps': 1,
			 \ 'global': 1,
			 \ 'headers': 1,
			 \ 'text_objs': 1,
			 \ 'table_format': 1,
			 \ 'table_mappings': 0,
			 \ 'lists': 1,
			 \ 'links': 1,
			 \ 'html': 1,
			 \ 'mouse': 0,
			 \ }
 augroup VimwikiRemaps
	 autocmd!
	 " unmap tab in insert mode
	 autocmd Filetype vimwiki silent! iunmap <buffer> <Tab>
	 " remap table tab mappings to M-n M-p
	 autocmd Filetype vimwiki inoremap <silent><expr><buffer> <M-n> vimwiki#tbl#kbd_tab()
	 autocmd Filetype vimwiki inoremap <silent><expr><buffer> <M-p> vimwiki#tbl#kbd_shift_tab()
	 " on enter if completion is open, complete first element otherwise use
	 " default vimwiki mapping
	 autocmd Filetype vimwiki inoremap <silent><expr><buffer> <cr> pumvisible() ? coc#_select_confirm()
				 \: "<C-]><Esc>:VimwikiReturn 1 5<CR>"
 augroup end

" Git Signs 
lua << EOF
require('gitsigns').setup {
  signs = {
		 add          = { text = '▎' },
		 change       = { text = '▎' },
		 delete       = { text = '_' },
		 topdelete    = { text = '‾' },
		 changedelete = { text = '~' },
		 untracked    = { text = '┆' },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}
EOF

" treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "javascript" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

" Lazygit
lua << EOF
	local Terminal  = require('toggleterm.terminal').Terminal
	local lazygit = Terminal:new({ cmd = "lazygit",dir = "git_dir", direction = 'float', float_opts = {
    border = "single",
  },
 })

	function _lazygit_toggle()
		lazygit:toggle()
	end

	vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
EOF

" nvim-tree
lua << EOF
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    git = {
        enable = true,
        timeout = 500,
    },
    view = {
				width = 30,
        number = false,
        relativenumber = false,
    },
})
EOF


" Clipboard image
lua << EOF
require'clipboard-image'.setup {
  -- Default configuration for all filetype
  default = {
    img_dir = "images",
    img_name = function() return os.date('%Y-%m-%d-%H-%M-%S') end, -- Example result: "2021-04-13-10-04-18"
    affix = "<\n  %s\n>" -- Multi lines affix
  },
  -- You can create configuration for ceartain filetype by creating another field (markdown, in this case)
  -- If you're uncertain what to name your field to, you can run `lua print(vim.bo.filetype)`
  -- Missing options from `markdown` field will be replaced by options from `default` field
  -- markdown = {
  --   img_dir = {"src", "assets", "img"}, -- Use table for nested dir (New feature form PR #20)
  --   img_dir_txt = "/assets/img",
  --   img_handler = function(img) -- New feature from PR #22
  --     local script = string.format('./image_compressor.sh "%s"', img.path)
  --     os.execute(script)
  --   end,
  -- }
}
EOF

" img paste.vim
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
" let g:mdip_imgdir = 'img'
" let g:mdip_imgname = 'image'

lua << EOF
--- todo-comments setup
require("todo-comments").setup()
EOF


