" phorust vimrc
" YCM requires compiling, read the repo's readme
" YCM needs this fix for the MacVim vim exec
"    install_name_tool -change /System/Library/Frameworks/Python.framework/Versions/2.7/Python /usr/local/Cellar/python/2.7.5/Frameworks/Python.framework/Versions/2.7/Python MacVim
" replace MacVim with the path to the MacVim exec being used for vim
"
" fix from https://github.com/Valloric/YouCompleteMe/issues/8

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" powerful, light statusline
Plugin 'bling/vim-airline'
" git symbols in the left margin
Plugin 'airblade/vim-gitgutter'
" directory exploration
Plugin 'scrooloose/nerdtree'
" multiline commenting
Plugin 'scrooloose/nerdcommenter'
" git, inside vim, if you can remember the commands
Plugin 'tpope/vim-fugitive'
" modern day completion for vim
Plugin 'Valloric/YouCompleteMe'
" vim navigation for tmux
Bundle 'christoomey/vim-tmux-navigator'
call vundle#end()
filetype plugin indent on

syntax on
" NERDtree
map <leader>e :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<CR>
" gitgutter
" let g:gitgutter_sign_column_always = 1	" always show diff col
nnoremap <c-g> :GitGutterToggle<CR><c-g>
let g:gitgutter_realtime = 1	" constantly show git diff
" statusline - use with airline
let g:airline_powerline_fonts = 1	" pretty arrows
set laststatus=2	" always show statusline

set backspace=indent,eol,start
				" allow backspacing over everything

" set nowrap	" don't wrap lines
" not crazy person style word wrapping
set wrap
set linebreak
set nolist

set autoindent
set copyindent	" copy prev indentation when autoindenting
set number
set showmatch	" show matching parens

set ignorecase	" ignore case in search
set smartcase	" ignore case if all low caps
				"otherwise, pay attention to caps
set ssop-=folds		" do not store folds


set shiftwidth=4
set shiftround	" use multiples of shiftwidth with < and >
set tabstop=4
set softtabstop=4
set smarttab	" insert tabs on start of line according to shiftwidth
				" not tabstop
set ruler

set hlsearch	" highlight search terms
set incsearch	" show search matches while typing
"nnoremap <esc> :noh<return><esc>
nnoremap <silent> <c-l> :nohls<cr><c-l>
				" press esc to end highlighting

set history=1000
set undolevels=1000
" don't beep me
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" set clipboard=unnamed,unnamedplus
				" use system clipboard on win,unix

set nobackup
set noswapfile	" live on the edge man #git

set autochdir	" set cwd to cur buffer's loc
autocmd BufEnter * silent! lcd %:p:h
				" set cwd to cur buffer's loc, for plugin

" gvim options
set guioptions-=m " menu bar
set guioptions-=T " toolbar
set guioptions-=r " righthand scroll bar
set guioptions-=L " lefthand scroll bar

" solve carpal tunnel
nnoremap ; :
" holy fuck why have i been in the dark ages
set mouse=a

" better tab movement
nmap <silent> <C-n> :tabnext<CR>
nmap <silent> <C-p> :tabprev<CR>
imap <silent> <C-n> <esc><C-n>
imap <silent> <C-p> <esc><C-p>

" stop bein a god-damned n00b
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

set t_Co=256
syntax enable
set background=dark
colorscheme molokai
if has("gui_running")
	if has("gui_win32")
		set encoding=utf-8
		set guifont=DejaVu_Sans_Mono_for_Powerline:h10
	elseif has("gui_macvim")
		set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
	elseif has("gui_gtk2")
		set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
	endif
endif

" highlighting and syntax
au BufRead,BufNewFile *.md set filetype=markdown	" highlighting for markdown
au BufRead,BufNewFile *.ejs set filetype=html		" highlight for ejs
" prefer 2 tabsize for web/frontend stuff
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
" trailing whitespace
nnoremap <silent> <leader>rtw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
set list	"see whitespace"
" set listchars=tab:→\ ,trail:· " the tab arrows are just too ugly
set listchars=tab:\ \ ,trail:·

set ssop-=options	" do not store global/local vars in sessions
