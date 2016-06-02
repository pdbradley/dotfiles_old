set nocompatible 
let mapleader = " "
"set omnifunc=syntaxcomplete#Complete
set complete=.,b,u,]


set backspace=2
"no backups since we are always in git (almost)
set nobackup
set nowritebackup
set noswapfile

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Let Vundle manage Vundle
"required
Plugin 'VundleVim/Vundle.vim'

"my bundles here:
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/ReplaceWithRegister'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'pangloss/vim-javascript'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'stefanoverna/vim-i18n.git'
Plugin 'thoughtbot/vim-rspec'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'pdbradley/vim-tmux-runner'
Plugin 'danro/rename.vim'
Plugin 'justinmk/vim-sneak'
Plugin 'tpope/vim-rails.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/ZoomWin'
Plugin 'scrooloose/syntastic'
Plugin 'kana/vim-fakeclip'
Plugin 'kchmck/vim-coffee-script'

"all this stuff below is for snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

colorscheme desert

call vundle#end()
filetype plugin indent on  "required!

"VTR (vim tmux runner) shortcuts:
let g:VtrPercentage = 50
let g:VtrOrientation = 'h'
let g:VtrClearOnReatach = 0
map <Leader>vo :VtrOpenRunner<CR>
map <Leader>vk :VtrKillRunner<CR>
map <Leader>vf :VtrFocusRunner<CR>
map <Leader>vd :VtrDetachRunner<CR>

map <Leader>x :VtrSendFile<CR>



"syntastic checkers to enable
let g:syntastic_coffee_checkers = ['coffeelint', 'coffee']
let g:syntastic_ruby_mri_exec = '~/.rbenv/versions/2.2.1/bin/ruby'

"javascript vars for vim-javascript
let g:javascript_enable_domhtmlcss = 1

set runtimepath+=~/.vim/bundle/vim-snippets

"fakeclip settings
let g:fakeclip_terminal_multiplexer_type = 'tmux'


"tags easytags ctags settings
"use a ctags file specific to the project
set tags=./tags
"don't write to the global ctags file
let g:easytags_dynamic_files = 2

"Rspec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
"map <Leader>l :call RunLastSpec()<CR>
map <Leader>* :call RunAllSpecs()<CR>
"let g:rspec_command = 'call VimuxRunCommand("bundle exec rspec {spec}\n")'
let g:rspec_command = "VtrSendCommandToRunner bundle exec spring rspec --format progress --require ~/code/rspec_support/quickfix_formatter.rb --format QuickfixFormatter --out quickfix.out {spec}\n"

" opens the quickfix file and window
:map <leader>j :cg quickfix.out \| cwindow<CR>

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
filetype off
filetype plugin on

map <Leader>l :silent !chrome-cli reload<cr>
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
"let g:snippetsEmu_key = "<S-Tab>"

" Switch between the last two files
nnoremap <leader><leader> <c-^>

"map zoomwin to leader z
nnoremap <leader>z :ZoomWin<CR>

" My Custom Mappings related to ctrl-p
" copied the idea for this from gary bernhardts vimrc
map <leader>gj :CtrlP app/assets/javascripts<cr>
map <leader>gv :CtrlP app/views<cr>
map <leader>gf :CtrlP spec/factories<cr>
map <leader>gc :CtrlP app/controllers<cr>
map <leader>gm :CtrlP app/models<cr>
map <leader>gh :CtrlPT app/helpers<cr>
map <leader>gl :CtrlP lib<cr>
map <leader>gsc :CtrlP spec/controllers<cr>
map <leader>gsm :CtrlP spec/models<cr>

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

"how2 stack overflow
"map <Leader>k :!how2 -l ruby 

"quick open for Dropbox and notes files
map <Leader>dr :e ~/Dropbox<cr>
map <Leader>pn :sp ~/Dropbox/work/notes/project-notes.txt<cr>
map <Leader>pa  :sp ~/Dropbox/work/notes/annoyances-notes.txt<cr>
map <Leader>pt :sp ~/Dropbox/work/notes/todo.txt<cr>

map <Leader>vimrc :sp $MYVIMRC<cr>
map <Leader>r :source $MYVIMRC<cr>


"these two lines help w search.  case ignored unless search string has
"uppercase anywhere
set ignorecase
set smartcase

"assume /g flag is on for search and replace
set gdefault
set bg=light


set cursorline

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

"some nice hashrocket ones

" cp copies and pastes the present paragraph (method)
nnoremap cp yap<S-}>p

" formats the current paragraph
nnoremap <leader>f =ip

" turns on paste and nopaste (messes with my typing)
"set pastetoggle=<leader>z

"apply macros with Q
nnoremap Q @q
vnoremap Q :norm @q<cr>

"shift direction to change tabs
noremap <S-l> gt
noremap <S-h> gT

"quit files with leader q
nnoremap  <leader>q :q<cr>


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
nnoremap <leader>N :NERDTreeFind<CR>


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

"ack on the word under the cursor
map <leader>k :Ack <C-R><C-W><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE  thanks bernhardt
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap <expr> %% expand('%:h').'/'
map <leader>e :edit %%
map <leader>v :view %%

runtime macros/matchit.vim

"create a new file AND directory by with :E filename
command -nargs=1 E execute('silent! !mkdir -p "$(dirname "<args>")"') <Bar> e <args>

"I18n plugin mappings
vmap <Leader>z :call I18nTranslateString()<CR>
vmap <Leader>dt :call I18nDisplayTranslation()<CR>


