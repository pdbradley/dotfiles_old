set nocompatible 
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Let Vundle manage Vundle
"required
Bundle 'gmarik/vundle'

"my bundles here:
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-fugitive'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'

Bundle 'thoughtbot/vim-rspec'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-rails.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'mileszs/ack.vim'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/ZoomWin'
Bundle 'scrooloose/syntastic'
Bundle 'kikijump/tslime.vim'
Bundle 'kana/vim-fakeclip'

"fakeclip settings
let g:fakeclip_terminal_multiplexer_type = 'tmux'


filetype plugin indent on  "required!

"Rspec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>

let mapleader = " "

"disable folding by default
set nofoldenable

" hopefully this will save buffers when I switch out of them
set autowrite

"tabs
map <C-t> <esc>:tabnew<CR>

"indentation matters...
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

set history=500

" syntax highlighting
syntax on 

" Customizations
set relativenumber
"set number
set nocompatible
set showmatch
set ruler
set showcmd
set smarttab
set noincsearch
set incsearch
set laststatus=2 " always show status line
set guioptions-=m       " Can't remember :)
set guioptions-=T       " No toolbars
set guioptions-=r       " No scrollbars

set visualbell t_vb=    " Don't beep

set hidden              " Don't prompt to save when switching buffers


" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Switch between the last two files
nnoremap <leader>b <c-^>

"map zoomwin to leader z
nnoremap <leader>z :ZoomWin<CR>

" My Custom Mappings related to ctrl-p
map <c-b> :CtrlPBuffer<CR>
" copied the idea for this from gary bernhardts vimrc
map <leader>gv :CtrlP app/views<cr>
map <leader>gf :CtrlP spec/factories<cr>
map <leader>gc :CtrlP app/controllers<cr>
map <leader>gm :CtrlP app/models<cr>
map <leader>gh :CtrlPT app/helpers<cr>
map <leader>gl :CtrlP lib<cr>
map <leader>gp :CtrlP public<cr>
map <leader>gs :CtrlP public/stylesheets<cr>

"rails vim quicker mappings
map <Leader>c :Rcontroller 
map <Leader>sc :RScontroller 
map <Leader>vc :RVcontroller 
map <Leader>m :Rmodel 
map <Leader>sm :RSmodel 
map <Leader>vm :RVmodel 

map <Leader>bb :!bundle install<cr>

"git mappings
map <Leader>gs :Gstatus<CR>

"quick open for Dropbox and notes files
map <Leader>dr :e ~/Dropbox<cr>
map <Leader>pn :sp ~/Dropbox/work/notes/project-notes.txt<cr>
map <Leader>ann :sp ~/Dropbox/work/notes/annoyances-notes.txt<cr>
map <Leader>td :sp ~/Dropbox/work/notes/todo.txt<cr>


"these two lines help w search.  case ignored unless search string has
"uppercase anywhere
set ignorecase
set smartcase

"assume /g flag is on for search and replace
set gdefault
set bg=light

"highlight current line
colorscheme desert
set cursorline
"hi CursorLine term=bold cterm=bold guibg=Grey40
hi CursorLine term=bold guibg=#222222 guibg=Grey40

"status line highlight
highlight StatusLine ctermfg=blue ctermbg=yellow

"rounds to the nearest indent point 
set shiftround

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

"make a little 5 line padding at top and bottom when scrolling
set scrolloff=5

augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

"get out of insert mode with a super seldom used character sequence
inoremap jj <ESC>

"no delay when hitting esc
set noesckeys

"omnicomplete text more readable
:highlight PmenuSel ctermfg=black


"map <leader>w to open a new vsplit and switch to it
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

"get to Ack quickly with leader a
nnoremap <leader>a :Ack
"use ag instead of ack with ack.vim; -i means case insensitive
"
let g:ackprg = 'ag -i --nogroup --nocolor --column --ignore-dir log --ignore-dir versions'

nnoremap <leader>n :NERDTreeToggle<CR>

"move around your splits with ctrl hjkl which b/c capslock is assigned to ctrl
"works well
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"tslime bindings
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

au BufReadPost *.dwt set syntax=html

"no backups since we are always in git (almost)
set nobackup
set nowritebackup
set noswapfile

"tell omni that I like rails
let g:rubycomplete_rails = 1


"omni completion activate!
filetype plugin on
set omnifunc=syntaxcomplete#Complete
runtime macros/matchit.vim


