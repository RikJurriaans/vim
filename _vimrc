" Pathogen
call pathogen#infect() 

set nocompatible
language english
syntax on

filetype plugin indent on
filetype plugin on

au BufEnter *.hs compiler ghc

let g:neocomplcache_enable_at_startup = 1

let g:haddock_browser = "C:\Program Files (x86)\Google\Chrome\Application"
let g:ghc = "C:\Program Files (x86)\Haskell Platform\2013.2.0.0\bin"
let g:haddock_docdir = "C:\Program Files (x86)\Haskell Platform\2013.2.0.0\doc\html"

set hidden
set lazyredraw
set showmode
set wildmenu

" Numbers
set relativenumber
set number

" Backspace
set backspace=2 

" Indention
set cindent
set tabstop=4
set shiftwidth=4
set expandtab
set ai

" leader
let mapleader = ' '

" easy vimrc editing and sourcing
nmap <silent> ,ev :e $MYVIMRC<cr>
nmap <silent> ,sv :so $MYVIMRC<cr>

" Mappings
imap <C-space> <C-x><C-o>
nnoremap <leader>; :%s:::g<Left><Left><Left>
nnoremap <leader>;' :%s:::cg<Left><Left><Left><Left>
inoremap jj <ESC>

" CSS change property
nnoremap <leader>cp f:<right>ct;

" Emmet
imap hh <C-y>,

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>q! :q!<CR>
nnoremap <leader>o <C-w>o

" window nav
nnoremap <leader>s <C-^>^
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>x <c-w>x

" buffer nav
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bw :bw<CR>
nnoremap <leader>b :buffers<CR>

" nnoremap dc d%

" Merk dat ik heel vaak indenting binnen haken fomat
nnoremap <leader>{ =i{

nnoremap <leader>zz 1z=
" correct, go to next
nnoremap <leader>zn 1z=]s

" alleen voor php files.
nnoremap tv yaWovar_dump(<esc>pi);<esc>


" OmniComplete replace with YCM if I ever get the nerves to install it...
set omnifunc=syntaxcomplete#Complete


" Look and feel
set background=dark
colorscheme base16-mocha

set guifont=Inconsolata\ for\ Powerline:h13
set guioptions-=T " Removes top toolbar
set guioptions-=l
set guioptions-=t
set guioptions-=R
set guioptions-=r " Removes right hand scroll bar
set guioptions-=L " Removes left hand scroll bar
set guioptions-=m " Remove menubar
set tabline=0
set nowrap
set hlsearch
set cursorline

scriptencoding utf-8
set encoding=utf-8

" "powerline symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" NerdTREE
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd vimenter * NERDTree
let g:NERDTreeDirArrows=1
let g:NERDTreeWinPos = "left"
let NERDTreeIgnore = ['\.hi$', '\.o$', '\.exe$']

" Call the fullscreen function
call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)
map <f11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

au GUIEnter * simalt ~x
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

set thesaurus+=~/vimfiles/thesaurus/thesaurus.txt

" voor txt bestanden.
function IsTxt()
    set spell
    set wrap
    set spelllang=nl
    set linebreak
endfunction

function IsHaskell()
    set tabstop=2
    set shiftwidth=2
endfunction

autocmd BufNewFile,BufRead *.txt, *.md call IsTxt()
autocmd BufNewFile,BufRead *.hs call IsHaskell()

" Open markdown files with Chrome.
autocmd BufEnter *.md exe 'noremap <F5> :!start C:\Program Files (x86)\Google\Chrome\Application\chrome.exe %:p<CR>'


map <C-F1> "vyiw:new<CR>:execute "r!lynx -dump http://localhost/phpman/function.".@v.".html"<CR>:1<CR>
