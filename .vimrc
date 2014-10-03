" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off
" source from current directory
set exrc
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'SirVer/ultisnips.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'itchyny/lightline.vim'
Plugin 'Valloric/YouCompleteMe.git'
Bundle 'scrooloose/nerdtree'
Bundle 'taglist.vim'
call vundle#end()


filetype plugin indent on
syntax on
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" do want title
set title

colorscheme molokai
" use all the wonderful 256 colors that urxvt supply
"set t_Co=256

" I can has lightline
set laststatus=2
let g:lightline = {
     \ 'component': {
     \   'readonly': '%{&readonly?"RO":""}',
     \ },
     \ 'separator': { 'left': '>', 'right': '<' },
     \ 'subseparator': { 'left': '->', 'right': '<-' }
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
set scrolloff=2      " I like to know what's next
set wildmenu
set wildmode=list:longest " wildmode works great this way
set fillchars=stl:-,stlnc:-,vert:\|,fold:_,diff:-
set smarttab
set list
set listchars=trail:-,tab:\>\ 
set hlsearch      " hilight searches
set showmode
set colorcolumn=100

set tags=+~/.vim/systags

" Shortmess off
set shortmess+=I
" Indentation stuff
"set fdm=indent
"set cindent
set autoindent
set smartindent
"set softtabstop=4
"set shiftwidth=4
set copyindent
"set expandtab
set completeopt=menu,longest,preview
"

" mappings
let mapleader=" "
" rot13 haxorize
map <Leader>r ggVGg?
" Indent
map <Leader>i gg=G<Return>
map <Leader>c :Gcommit<Return>
" Make
map <Leader>m :!make<Return>
" Taglist
map <Leader>t :TlistToggle<Return>
" NERDTree
map <Leader>n :NERDTreeToggle<Return>
" input current time and date
map <Leader>d :r !date<Return><ESC>o=============<ESC>k$a **<ESC>i
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

" Ycm vs ultisnips
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_select_previous_compltetion=[]

let &path = "/usr/avr/include,/usr/include,./"

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" Open MS word doc with antiword
autocmd BufReadPre *.doc set ro
autocmd BufReadPre *.doc set hlsearch!
autocmd BufReadPost *.doc %!antiword "%"

" For arduino syntax
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino
" To automatically put a comment in a new ino-file
autocmd bufnewfile *.ino so /home/gabriel/.vim/templates/c_header.txt
autocmd bufnewfile *.ino exe "1," . 8 . "g/File Name :.*/s//File Name : " .expand("%")
autocmd bufnewfile *.ino exe "1," . 8 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.ino execute "normal ma"
autocmd Bufwritepre,filewritepre *.ino exe "1," . 10 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.ino execute "normal `a"
"
" To automatically put a comment in a new c-file
autocmd bufnewfile *.c so /home/gabriel/.vim/templates/c_header.txt
autocmd bufnewfile *.c exe "1," . 8 . "g/File Name :.*/s//File Name : " .expand("%")
autocmd bufnewfile *.c exe "1," . 8 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.c execute "normal ma"
autocmd Bufwritepre,filewritepre *.c exe "1," . 10 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.c execute "normal `a"
"
" To automatically put a comment in a new h-file
autocmd bufnewfile *.h so /home/gabriel/.vim/templates/h_header.txt
autocmd bufnewfile *.h exe "1," . 8 . "g/File Name :.*/s//File Name : " .expand("%")
autocmd bufnewfile *.h exe "1," . 8 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.h execute "normal ma"
autocmd Bufwritepre,filewritepre *.h exe "1," . 10 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.h execute "normal `a"
