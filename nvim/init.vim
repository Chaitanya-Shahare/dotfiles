
" #################################################################################
" ##################               PLUGINS                #########################
" #################################################################################

call plug#begin()

" Utility
    Plug 'sheerun/vim-polyglot'
	Plug 'itchyny/lightline.vim'
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'alvan/vim-closetag'
	Plug 'ekickx/clipboard-image.nvim'
	Plug 'psliwka/vim-smoothie'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'scrooloose/NERDTree'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'ap/vim-css-color'
    Plug 'jiangmiao/auto-pairs'
	Plug 'preservim/vim-markdown'
" Colorschemes
	Plug 'EdenEast/nightfox.nvim'
	Plug 'rebelot/kanagawa.nvim'

call plug#end()





" #################################################################################
" ##################            BASIC SETTINGS              #######################
" #################################################################################

set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
set relativenumber
set nowrap
set cursorline
" set cursorcolumn
set clipboard=unnamedplus
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set mouse=a
set splitright
set splitbelow
set noshowmode

colo kanagawa

highlight Normal guibg=none
highlight NonText guibg=none


" #################################################################################
" ##################               REMAPS                 #########################
" #################################################################################

let mapleader=" "
imap jj <C-{>
cmap jj <C-{>
tnoremap jj <C-\><C-N>

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
exec "!time python2.7 %"
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

nnoremap <C-p> :FZF<CR>
nnoremap <C-n> :NERDTree<CR>

autocmd Filetype markdown source ~/.config/nvim/scripts/markdown.vim



" #################################################################################
" ##################            PLUGINS CONFIG            #########################
" #################################################################################

" lightline -----------------------------------------------------------------------
let g:lightline = {
\ 'colorscheme': 'nightfox',
\ }

" coc -----------------------------------------------------------------------------
source $HOME/.config/nvim/plug-config/coc.vim

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
