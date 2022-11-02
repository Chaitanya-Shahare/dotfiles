" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
	" Tokyo night VS Code colorscheme
	Plug 'ghifarit53/tokyonight-vim'
	" Gruvbox-community colorscheme
	Plug 'gruvbox-community/gruvbox'
	" Indent line with | for tabs
	Plug 'Yggdroot/indentLine'
	" Smooth scorlling usin crtl + u/d
	Plug 'psliwka/vim-smoothie'
	" Quickly comment with a keybind
	Plug 'tpope/vim-commentary'
	" Lightline simple aesthetic status bar
	Plug 'itchyny/lightline.vim'
	" Better Syntax highlighting for Python
	Plug 'vim-python/python-syntax'
	" Colorscheme like atom text editor
	Plug 'gosukiwi/vim-atom-dark'
	" Fuzzy finder
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	" Vim surrounding for tags
	Plug 'tpope/vim-surround'
	" Autoclosing HTML tags
	Plug 'alvan/vim-closetag'
	" COC autocomplete
	Plug 'neoclide/coc.nvim', {'branch': 'release'}	

call plug#end()
