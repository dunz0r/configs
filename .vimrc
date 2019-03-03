" This must be first, because it changes other options as a side effect.
set nocompatible
set encoding=utf-8
scriptencoding utf-8
" source from current directory
set exrc
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive.git'
Plugin 'itchyny/lightline.vim'
Plugin 'tomasr/molokai'
Plugin 'aperezdc/vim-template'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'srcery-colors/srcery-vim'
Plugin 'rhysd/open-pdf.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'vim-scripts/openscad.vim'
Plugin 'nathanaelkane/vim-indent-guides' 
Plugin 'scrooloose/nerdtree'
Plugin 'taglist.vim'
Plugin 'morhetz/gruvbox'
call vundle#end()

filetype plugin indent on
syntax on
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" do want title
set title

" use all the wonderful 256 colors that urxvt supply
set termguicolors
set background=dark
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic='1'
colorscheme gruvbox

set laststatus=2
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\}
set fdm=marker
set incsearch " do incremental searching
set backupdir=/tmp
set fileformat=unix
set history=50 " keep 50 lines of command line history
" Display
set number  " I like line numbers
set numberwidth=4   " I usually only edit small files so therefore 4 digits should be enough
set nolazyredraw      " redraw!
set showcmd      " display incomplete commands
set smartcase      " searching
set noshowmode
set scrolloff=2      " I like to know what's next
set wildmenu
set wildmode=list:longest " wildmode works great this way
set fillchars=stl:-,stlnc:-,vert:\|,fold:_,diff:-
set list
set showbreak=↪\
set listchars=tab:→·,trail:·,extends:),precedes:(,nbsp:␣,eol:↲
set hlsearch      " hilight searches
set showmode

set tags=+~/.vim/systags

" Shortmess off
set shortmess+=I
" Indentation stuff
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

set completeopt=menu,longest,preview

" Set nerdtree to always open on the right
let g:NERDTreeWinPos = "right"


" Template settings
let g:email = 'gf@hax0r.se'
let g:username = 'Gabriel Fornaeus'
let g:license = 'GPL3'
"
" mappings
let mapleader=" "

" Indent
map <Leader>i gg=G<Return>
" Git Commit
map <Leader>c :Gcommit<Return>
" Make
map <Leader>m :!make<Return>
" Taglist
map <Leader>t :TlistToggle<Return>
" NERDTree
map <Leader>n :NERDTreeToggle<Return>
" input current time and date
" map <Leader>D :r !date<Return><ESC>o=============<ESC>k$a **<ESC>i
map <Leader>D :VimwikiTabMakeDiaryNote<Return>
" open a new tab
map <Leader>N :tabnew<Return>
" open the wiki in a new tab
map <Leader>w :VimwikiTabIndex<Return>
" Use hjkl you tit!
map <Up> <NOP>
map <Down> <NOP>
map <Left> <NOP>
map <Right> <NOP>
" Because I always hit help by accident
nnoremap <F1> <nop>
" Make a comment
map <Leader>C <ESC>i/*<ESC>o<ESC>o/<ESC>ki <ESC>a

map <silent> <Leader><Space> :nohlsearch<CR>
" grep should always generate a file-name
set grepprg=grep\ -nH\ $*

"dictionary thingies
set iskeyword+=:
set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif

augroup END

" I want tabs
augroup python_files
	autocmd!
	autocmd FileType python setlocal noexpandtab
	autocmd FileType python set tabstop=4
	autocmd FileType python set shiftwidth=4
augroup END


" Open MS word doc with antiword
autocmd BufReadPre *.doc set ro
autocmd BufReadPre *.doc set hlsearch!
autocmd BufReadPost *.doc %!antiword "%"

" my own, personal wiki
let g:vimwiki_list = [{'path' : '/mnt/c/Users/forgab/Nextcloud/wiki', 'ext' : '.md', 'syntax' :  'markdown'}]

" Neocomplete!
let g:neocomplete#enable_at_startup = 1

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB>
			\ pumvisible() ? "\<C-n>" :
			\ neosnippet#expandable_or_jumpable() ?
			\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
let g:neosnippet#snippets_directory='/home/gabriel/.vim/bundle/neosnippet-snippets/neosnippets/'

set modeline
let g:indent_guides_enable_on_vim_startup = 1
