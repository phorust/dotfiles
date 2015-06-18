" phorust vimrc
" YCM requires compiling, read the repo's readme
" YCM needs this fix for the MacVim vim exec
"    install_name_tool -change /System/Library/Frameworks/Python.framework/Versions/2.7/Python /usr/local/Cellar/python/2.7.5/Frameworks/Python.framework/Versions/2.7/Python MacVim
" replace MacVim with the path to the MacVim exec being used for vim
"
" fix from https://github.com/Valloric/YouCompleteMe/issues/8

set nocompatible
filetype off

"***** PLUGINS *****
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
" javascript completion
Plugin 'marijnh/tern_for_vim'
" javascript type checking
Plugin 'facebook/vim-flow'
" javascript coloring and folding
Plugin 'vim-javascript'
" vim navigation for tmux
Bundle 'christoomey/vim-tmux-navigator'
" automatically detect indentation
Plugin 'tpope/vim-sleuth'
" automatically save a Session.vim, for tmux-resurrect
Plugin 'tpope/vim-obsession'
" ctrl-p fuzzy searching
Plugin 'kien/ctrlp.vim'
" signs for hg
Plugin 'mhinz/vim-signify'
" search should show Match n of N
Plugin 'henrik/vim-indexed-search.git'
" align things nicely
Plugin 'godlygeek/tabular'
" nice code review
Plugin 'phleet/vim-arcanist'
" fav colors
Plugin 'tomasr/molokai'
Plugin 'benjaminwhite/Benokai'
Plugin 'vyshane/vydark-vim-color'
Plugin 'ajh17/Spacegray.vim'
Plugin 'effkay/argonaut.vim'
Plugin 'chankaward/vim-railscasts-theme'
Plugin 'blerins/flattown'
Plugin 'whatyouhide/vim-gotham'
Plugin 'sjl/badwolf'
Plugin 'morhetz/gruvbox'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'w0ng/vim-hybrid'
Plugin 'jordwalke/flatlandia'
Plugin 'junegunn/seoul256.vim'
call vundle#end()
filetype plugin indent on


"***** REMAPPINGS *****
" solve carpal tunnel
nnoremap ; :
" stop bein a god-damned n00b
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
" copy to system clipboard
vmap <C-c> :w !pbcopy<CR><CR>
vmap <C-v> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
map <leader>v :set paste!<CR>
" reselect after shift
vnoremap < <gv
vnoremap > >gv

" better tab movement
nmap <silent> <C-n> :tabnext<CR>
nmap <silent> <C-b> :tabprev<CR>
" trailing whitespace
nnoremap <silent> <leader>rtw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" this causes errors with drawing... or something. disabled.
"nnoremap <esc> :noh<return><esc>	" press esc to end highlighting
nnoremap <silent> <leader><esc> :nohls<cr><c-l>	" press \<esc> to end hl
" the CAPS LOCK key as ESC on an apple keyboard sometimes doesn't work so
imap ;w<CR> <ESC>:w<CR>

" plugin specific
" fugitive / gitgutter
map <leader>gd :Gdiff<CR>
map <leader>gb :Gblame<CR>
map <leader>gg :Gbrowse<CR> " Git Github
" vim-signify literally takes 1 whole second on save
map <leader>s :SignifyToggle<CR>
" not gj, gk cuz that takes too long
nmap <leader>j <Plug>GitGutterNextHunk
nmap <leader>k <Plug>GitGutterPrevHunk
" press - to stage/reset
map <leader>gs :Gstatus<CR>
map <leader>gc :Gcommit<CR>
" fix quickfix things
map <leader>h :cp<CR>
map <leader>l :cn<CR>
" nnoremap <c-g> :GitGutterToggle<CR><c-g>
" NERDtree
map <leader>e :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<CR>
" YCM
map <C-g> :YcmCompleter GoTo<CR>
" visually align things
vmap <leader>a= :Tabularize /=<CR>
vmap <leader>a: :Tabularize /:<CR>
vmap <leader>a\| :Tabularize /\|<CR>
vmap <leader>a" :Tabularize /"<CR>
vmap <leader>a< :Tabularize /<<CR>
vmap <leader>a/ :Tabularize //<CR>


"***** BASIC VIM SETTINGS *****
set laststatus=2		" always show statusline

set backspace=indent,eol,start	" allow backspacing over everything

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
		"   otherwise, pay attention to caps
set ssop-=folds	" do not store folds


set ruler
set scrolloff=5	" always show at least 5 lines above/below cursor
set scrolljump=5	" scroll by 5 lines at a time
set cc=80

set hlsearch	" highlight search terms
set incsearch	" show search matches while typing

set history=1000
set undolevels=1000
" don't beep me
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" set clipboard=unnamed,unnamedplus	" use system clipboard on win,unix

set nobackup
set noswapfile 				" live on the edge man #git

set autochdir 				" set cwd to cur buffer's loc
"autocmd BufEnter * silent! lcd %:p:h	" set cwd to cur buffer's loc,
					" was for NERDTree but dont need
" autochdir and it's friends don't play well with tmux-resurrect...

" gvim options
set guioptions-=m " menu bar
set guioptions-=T " toolbar
set guioptions-=r " righthand scroll bar
set guioptions-=L " lefthand scroll bar

" holy fuck why have i been in the dark ages
set mouse=a
set undofile
set undodir=~/.vimundo/ " this directory must exist

set ssop-=options	" do not store global/local vars in sessions

"***** FONT AND COLOR *****
set t_Co=256
syntax enable
set background=dark
colorscheme badwolf
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
" | as cursor in insert mode instead of block
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" highlighting and syntax
au! BufRead,BufNewFile *.md   set filetype=markdown	" highlighting for markdown
au! BufRead,BufNewFile *.ejs  set filetype=html		  " highlight for ejs
au! BufRead,BufNewFile *.txt  set filetype=text
au! BufRead,BufNewFile README set filetype=text
" prefer 2 tabsize for web/frontend stuff
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
set list	"see whitespace"
" set listchars=tab:→\ ,trail:· " the tab arrows are just too ugly
set listchars=tab:\ \ ,trail:·


"***** PLUGIN SETTINGS *****
syntax on
" gitgutter
" let g:gitgutter_sign_column_always = 1	" always show diff col
let g:gitgutter_realtime = 1	" constantly show git diff
" use signify for everything that isn't git
" except it's fucking a slow piece of shit
let g:signify_disable_by_default = 1
let g:signify_vcs_list = [ 'hg', 'perforce', 'svn' ]
let g:signify_sign_change = "~"
" statusline - use with airline
let g:airline_powerline_fonts = 1	" pretty arrows
let g:ycm_global_ycm_extra_conf = '~/git/dotfiles/ycm_extra_conf.py'
" https://github.com/rasendubi/dotfiles/blob/d534c5fb6bf39f0d9c8668b564ab68b6e3a3eb78/.vim/.ycm_extra_conf.py
let g:ycm_goto_buffer_command = 'new-tab'
autocmd CompleteDone * pclose 	" close [Scratch] [Preview] split after completion
let g:flow#autoclose = 1				" close quickfix after vim-flow check
