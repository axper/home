" Forget about Vi
set nocompatible
" How many lines to remember
set history=5000
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Don't keep a backup file (USE VCS!!!)
"set nobackup
set nowb
set noswapfile
" Show cursor position
set ruler
" Display incomplete commands
set showcmd
" Do incremental searching
set incsearch
" Set to auto read when a file is changed from the outside
set autoread
" Enable mouse if supported
if has('mouse')
  set mouse=a
endif
" Highlight last search pattern
set hlsearch
" Set number of lines to the cursor when moving up & down
set so=0
" Enable command visual tab-completion/suggestion
set wildmenu
" Wildmenu ignore compiled files
set wildignore=*.o,*~
" Height of the command bar
set cmdheight=1
" A buffer becomes hidden when it is abandoned
set hid
" Ignore case when searchinig
set ignorecase
" When searching try to be smart about cases
set smartcase
" Makes search act like search in modern browsers
set incsearch
" Don't redraw while executing macros (good performance config)
set lazyredraw
" For regular expressions turn magic on
set magic
" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2
" Set utf-8 encoding and en_US as language
set encoding=utf8
" Use unix file endings
set ffs=unix,dos,mac
" Tab size
set shiftwidth=4
set tabstop=4
" Don't use spaces instead of tabs
set noexpandtab
" Be smart when using tabs
set smarttab
" Enable autoindent
set autoindent
" Enable smart indent
set smartindent
" Wrap lines
set wrap
" Put cursor at beginning of tab
set list lcs=tab:\ \ 
" Always show the status line
"set laststatus=2
" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
" Highlight current line
"set cursorline
" Open new windows such as preview window at the bottom
set splitbelow
" Disable cursor blinking
set guicursor+=a:blinkon0
"remove menu bar
set guioptions-=m
"remove toolbar
set guioptions-=T
" Font
set guifont=DejaVu\ Sans\ Mono\ 9
" Use system clipboard
set clipboard=unnamedplus
" Case insensitive search
set smartcase

" Enable syntax highlighting
syntax enable


" Treat long lines as line breaks
map j gj
map k gk

" Enter will clear current highlighting
nnoremap <Return> :noh<CR><esc>

" Remove the Windows ^M - when the encodings gets messed up
"noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm


" Jump to the last known cursor position.
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

" Delete trailing white space on save
"func! DeleteTrailingWS()
"  exe "normal mz"
"  %s/\s\+$//ge
"  exe "normal `z"
"endfunc
"autocmd BufWrite *.* :call DeleteTrailingWS()

filetype plugin indent on

" Do not show preview window
set completeopt-=preview

" File extension highlighting
autocmd BufRead,BufNewFile PKGBUILD set filetype=PKGBUILD
autocmd BufRead,BufNewFile *.asm set filetype=nasm
autocmd BufRead,BufNewFile *.nasm set filetype=nasm

colorscheme desert

