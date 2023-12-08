
" #################################################################################
" ##################               PLUGINS                #########################
" #################################################################################

call plug#begin()

" Utility
		 " Plug 'sheerun/vim-polyglot'
		 " Plug 'itchyny/lightline.vim'
		 Plug 'christoomey/vim-tmux-navigator'
		 Plug 'nvim-lualine/lualine.nvim'
		 Plug 'tpope/vim-commentary'
		 Plug 'tpope/vim-surround'
		 Plug 'alvan/vim-closetag'
		 Plug 'lukas-reineke/indent-blankline.nvim'
		 Plug 'img-paste-devs/img-paste.vim' 
		 Plug 'psliwka/vim-smoothie'
		 " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
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
		 Plug 'nvim-telescope/telescope.nvim'
		 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
		 Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': 'markdown' }
		 Plug 'akinsho/toggleterm.nvim'
		 " Plug 'mbbill/undotree'
		 Plug 'github/copilot.vim'
		 Plug 'folke/zen-mode.nvim'
		 Plug 'nvim-tree/nvim-tree.lua'
		 Plug 'nvim-tree/nvim-web-devicons'
		 Plug 'folke/todo-comments.nvim'
		 Plug 'stevearc/aerial.nvim'
		 Plug 'simrat39/symbols-outline.nvim'
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
set mouse=a mousefocus
set splitright
set splitbelow
set noshowmode
set ignorecase
" set listchars=tab:\|\ 
" set list

" focus on mouse hover in nvim split panes


colo kanagawa-dragon

" highlight Normal guibg=none
" highlight NonText guibg=none
" highlight Normal ctermbg=none
" highlight NonText ctermbg=none
" au ColorScheme * hi Normal ctermbg=none guibg=none

" text folding
autocmd BufWinLeave *.* silent mkview
autocmd BufWinEnter *.* silent loadview

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


nnoremap <C-n> :NvimTreeToggle<CR>

" Toggle relative line numbers on and off with <leader>rn
nnoremap <leader>ln :call ToggleRelativeLineNumbers()<CR>

function! ToggleRelativeLineNumbers()
  if &relativenumber
    set norelativenumber
    " set number
  else
    set relativenumber
    " set nonumber
  endif
endfunction

" Toggle github copilot
nnoremap <leader>gce :Copilot enable<CR>
nnoremap <leader>gcd :Copilot disable<CR>

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


"
" + toggle remap arrow keys to resize windows
"
nnoremap <leader>r :call ToggleResizeMode()<CR>

let s:KeyResizeEnabled = 0

function! ToggleResizeMode()
  if s:KeyResizeEnabled
    call NormalArrowKeys()
    let s:KeyResizeEnabled = 0
  else
    call ResizeArrowKeys()
    let s:KeyResizeEnabled = 1
  endif
endfunction

function! NormalArrowKeys()
  " unmap arrow keys
  echo 'normal hjkl keys'
  nunmap k
  nunmap j
  nunmap h
  nunmap l
endfunction

function! ResizeArrowKeys()
  " Remap arrow keys to resize window
  echo 'Resize window with hjkl keys'
  nnoremap k    :resize +2<CR>
  nnoremap j  :resize -2<CR>
  nnoremap h  :vertical resize -2<CR>
  nnoremap l :vertical resize +2<CR>
endfunction


" lualine -----------------------------------------------------------------------
lua << EOF
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    --component_separators = { left = '', right = ''},
    --section_separators = { left = '', right = ''},
		section_separators = '',
		component_separators = '',
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
    -- lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_x = {'fileformat', 'filetype'},
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
local mode_map = {
  ['NORMAL'] = 'NOR',
  ['INSERT'] = 'INS',
  ['VISUAL'] = 'VIS',
-- 	['O-PENDING'] = 'NOR?',
--  ['V-BLOCK'] = 'VB',
--  ['V-LINE'] = 'VL',
--  ['V-REPLACE'] = 'VR',
--  ['REPLACE'] = 'R',
--  ['COMMAND'] = '!',
		['COMMAND'] = 'COM',
--  ['SHELL'] = 'SH',
--  ['TERMINAL'] = 'T',
--  ['EX'] = 'X',
--  ['S-BLOCK'] = 'SB',
--  ['S-LINE'] = 'SL',
--  ['SELECT'] = 'S',
--  ['CONFIRM'] = 'Y?',
--  ['MORE'] = 'M',
}
require('lualine').setup({
  sections = {
    lualine_a = { {'mode', fmt = function(s) return mode_map[s] or s end} },
  }
})
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

	vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
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

" img paste.vim
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
" let g:mdip_imgdir = 'img'
" let g:mdip_imgname = 'image'

lua << EOF
--- todo-comments setup
require("todo-comments").setup()
EOF


" ariel.nvim
lua << EOF
require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
EOF

" symbols-outline
lua << EOF
require('symbols-outline').setup(
{
  highlight_hovered_item = true,
  show_guides = true,
  auto_preview = false,
  position = 'right',
  relative_width = true,
  width = 25,
  auto_close = false,
  show_numbers = false,
  show_relative_numbers = false,
  show_symbol_details = true,
  preview_bg_highlight = 'Pmenu',
  autofold_depth = nil,
  auto_unfold_hover = true,
  fold_markers = { '', '' },
  wrap = false,
  keymaps = { -- These keymaps can be a string or a table for multiple keys
    close = {"<Esc>", "q"},
    goto_location = "<Cr>",
    focus_location = "o",
    hover_symbol = "<C-space>",
    toggle_preview = "K",
    rename_symbol = "r",
    code_actions = "a",
    fold = "h",
    unfold = "l",
    fold_all = "W",
    unfold_all = "E",
    fold_reset = "R",
  },
  lsp_blacklist = {},
  symbol_blacklist = {},
  symbols = {
    File = { icon = "", hl = "@text.uri" },
    Module = { icon = "", hl = "@namespace" },
    Namespace = { icon = "", hl = "@namespace" },
    Package = { icon = "", hl = "@namespace" },
    Class = { icon = "𝓒", hl = "@type" },
    Method = { icon = "ƒ", hl = "@method" },
    Property = { icon = "", hl = "@method" },
    Field = { icon = "", hl = "@field" },
    Constructor = { icon = "", hl = "@constructor" },
    Enum = { icon = "ℰ", hl = "@type" },
    Interface = { icon = "ﰮ", hl = "@type" },
    Function = { icon = "", hl = "@function" },
    Variable = { icon = "", hl = "@constant" },
    Constant = { icon = "", hl = "@constant" },
    String = { icon = "𝓐", hl = "@string" },
    Number = { icon = "#", hl = "@number" },
    Boolean = { icon = "⊨", hl = "@boolean" },
    Array = { icon = "", hl = "@constant" },
    Object = { icon = "⦿", hl = "@type" },
    Key = { icon = "🔐", hl = "@type" },
    Null = { icon = "NULL", hl = "@type" },
    EnumMember = { icon = "", hl = "@field" },
    Struct = { icon = "𝓢", hl = "@type" },
    Event = { icon = "🗲", hl = "@type" },
    Operator = { icon = "+", hl = "@operator" },
    TypeParameter = { icon = "𝙏", hl = "@parameter" },
    Component = { icon = "", hl = "@function" },
    Fragment = { icon = "", hl = "@constant" },
  },
}
)
EOF
