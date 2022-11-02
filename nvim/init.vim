"---------------------------------Plugins-------------------------------------------
source $HOME/.config/nvim/vim-plug/plugins.vim


""---------------------------------Sourcing .vimrc-------------------------------------------
set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    source ~/.vimrc


"---------------------------------lightline colorscheme-------------------------------------------
let g:lightline = {
\ 'colorscheme': 'Tomorrow_Night',
\ }



"---------------------------------nvim config-------------------------------------------

" Set colorscheme
colorscheme gruvbox

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

" Sourcing coc.vim 
source $HOME/.config/nvim/plug-config/coc.vim

"---------------------------------New nvim config---------------------------------------------------

" " Sourcing settings.vim
" source $HOME/.config/nvim/general/settings.vim

" " Sourcing mapping.vim
" source $HOME/.config/nvim/keys/mappings.vim
