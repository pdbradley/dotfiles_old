set nocompatible 
filetype off
let mapleader = " "

filetype plugin on
set omnifunc=syntaxcomplete#Complete


set backspace=2
"no backups since we are always in git (almost)
set nobackup
set nowritebackup
set noswapfile

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Let Vundle manage Vundle
"required
Bundle 'gmarik/vundle'

"my bundles here:
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-dispatch'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'

Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-easytags'

Bundle 'thoughtbot/vim-rspec'
Bundle 'benmills/vimux'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'scrooloose/nerdcommenter.git'


Bundle 'justinmk/vim-sneak'
Bundle 'tpope/vim-rails.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/ZoomWin'
Bundle 'scrooloose/syntastic'
Bundle 'kana/vim-fakeclip'

"all this stuff below is for snippets
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'


set runtimepath+=~/.vim/bundle/vim-snippets

"fakeclip settings
let g:fakeclip_terminal_multiplexer_type = 'tmux'

filetype plugin indent on  "required!


"Rspec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>* :call RunAllSpecs()<CR>
"let g:rspec_command = 'call VimuxRunCommand("bundle exec rspec {spec}\n")'
let g:rspec_command = 'call VimuxRunCommand("bundle exec rspec --format progress --require ~/code/rspec_support/vim_formatter.rb --format VimFormatter --out quickfix.out {spec}\n")'
" opens the quickfix file and window
:map <leader>q :cg quickfix.out \| cwindow<CR>

"disable folding by default
set nofoldenable

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
set ruler "show cursor position all the time
set showcmd "display incomplete commands
set autowrite " hopefully this will save buffers when I switch out of them
set laststatus=2 " always show status line
set smarttab
set noincsearch
set incsearch
set guioptions-=m       " Can't remember :)
set guioptions-=T       " No toolbars
set guioptions-=r       " No scrollbars
set visualbell t_vb=    " Don't beep
set hidden              " Don't prompt to save when switching buffers

"Display extra whitespace
set list listchars=tab:»·,trail:·

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Switch between the last two files
nnoremap <leader><leader> <c-^>

"map zoomwin to leader z
nnoremap <leader>z :ZoomWin<CR>

" My Custom Mappings related to ctrl-p
" copied the idea for this from gary bernhardts vimrc
map <leader>gv :CtrlP app/views<cr>
map <leader>gf :CtrlP spec/factories<cr>
map <leader>gc :CtrlP app/controllers<cr>
map <leader>gm :CtrlP app/models<cr>
map <leader>gh :CtrlPT app/helpers<cr>
map <leader>gl :CtrlP lib<cr>

"rails vim quicker mappings
map <Leader>c :Rcontroller 
"map <Leader>sc :RScontroller 
map <Leader>vc :RVcontroller 
map <Leader>m :Rmodel 
"map <Leader>sm :RSmodel 
map <Leader>vm :RVmodel 

map <Leader>bb :!bundle install<cr>

"git mappings
map <Leader>gs :Gstatus<CR>

"quick open for Dropbox and notes files
map <Leader>dr :e ~/Dropbox<cr>
map <Leader>pn :sp ~/Dropbox/work/notes/project-notes.txt<cr>
map <Leader>noy :sp ~/Dropbox/work/notes/annoyances-notes.txt<cr>
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
highlight NonText guibg=#060606

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


"map <leader>w to open a new vsplit and switch to it
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

"get to Ack quickly with leader a
nnoremap <leader>a :Ack

"use ag instead of ack with ack.vim; -i means case insensitive
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

let g:ackprg = 'ag -i --nogroup --nocolor --column --ignore-dir log --ignore-dir versions'

nnoremap <leader>n :NERDTreeToggle<CR>

"move around your splits with ctrl hjkl which b/c capslock is assigned to ctrl
"works well
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

au BufReadPost *.dwt set syntax=html

"pbcopy shortcuts to get to system clipboard
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>
" use the system clipboard
set clipboard=unnamed

"stop autocommenting of the next line under a comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"better instapaste (thanks orenstein!)
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>

"grab into system clipboard
map <leader>y "*y


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE  thanks bernhardt
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap <expr> %% expand('%:h').'/'
map <leader>e :edit %%
map <leader>v :view %%

runtime macros/matchit.vim
