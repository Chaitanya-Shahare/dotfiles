"---------------------------------Plugins-------------------------------------------
source $HOME/.config/nvim/vim-plug/plugins.vim


""---------------------------------Sourcing .vimrc-------------------------------------------
" Plugin manager 
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number
set relativenumber 
" Text wrapping
set nowrap

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
"set cursorcolumn


set clipboard=unnamedplus " Copy paste between vim and everything else

" Remapping esc to jj in insert , visual and command mode
imap jj <C-[>
"vmap jj <C-[>
cmap jj <C-[>
tnoremap jj <C-\><C-N>


" set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set tabstop=4
set shiftwidth=4
set autoindent
" colorscheme gruvbox


" Map the F5 key to run a Python script inside Vim.
" I map F5 to a chain of commands here.
" :w saves the file.
" <CR> (carriage return) is like pressing the enter key.
" !clear runs the external clear screen command.
" !python3 % executes the current file with Python.
"nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>
nnoremap <f3> :w <CR>
nnoremap <f4> :!clear <CR>
" autocmd filetype python nnoremap <F5> :w <bar> exec '!python3 '.shellescape('%')<CR>
" autocmd filetype python nnoremap <F5> :w <CR> :term python3 % <CR>
" autocmd filetype c nnoremap <F5> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
" autocmd filetype cpp nnoremap <F5> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
"
" Below is experimental code for running most types of codes
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

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
"set statusline=

" Status line left side.
"  set statusline+=\ %F\ %M\ %Y\ %R
"set statusline+=\ %M\ %Y\ %R 

" Use a divider to separate the left side from the right side.
"set statusline+=%=

" Status line right side.
" set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
"set statusline+=\ \ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
"set laststatus=2

" }}}


" Disable background color
hi Normal guibg=NONE ctermbg=NONE



"---------------------------------lightline colorscheme-------------------------------------------
let g:lightline = {
\ 'colorscheme': 'Tomorrow_Night',
\ }



"---------------------------------nvim config-------------------------------------------

" Set colorscheme
colorscheme hybrid_material

" Disable background color
hi Normal guibg=NONE ctermbg=NONE

" Turning on mouse controls
set mouse=a
"
" Don't show modes in the last line
set noshowmode

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Better window spliting
set splitright
set splitbelow


" Fuzzy finder shortcut
nnoremap <C-p> :FZF<CR>

" Mapping for NerdTree 
nnoremap <C-n> :NERDTree<CR>

" Mapping for pasting images in markdown
nnoremap <f7> :PasteImg <CR>

nnoremap <f2> :!markdowntopdf % <CR>

" Sourcing coc.vim 
source $HOME/.config/nvim/plug-config/coc.vim

" Disable background color
hi Normal guibg=NONE ctermbg=NONE


" for markdown 
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" Auto pair plugin config
" au Filetype markdown let b:AutoPairs = {"$": "$"}

"---------------------------------New nvim config---------------------------------------------------

" " Sourcing settings.vim
" source $HOME/.config/nvim/general/settings.vim

" " Sourcing mapping.vim
" source $HOME/.config/nvim/keys/mappings.vim
