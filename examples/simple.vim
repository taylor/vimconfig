call pathogen#infect()

" Mouse and clipboard
"set mouse=n
"set clipboard+=unnamed  " Yanks go on clipboard instead.
"
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)

" first the disabled features due to security concerns
set modelines=0               " no modelines [http://www.guninski.com/vim1.html]
let g:secure_modelines_verbose=0 " securemodelines vimscript
let g:secure_modelines_modelines = 15 " 15 available modelines

set nocompatible
syntax on
set history=200		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
"set nu " line numbers
set backspace=indent,eol,start
set noerrorbells
set visualbell t_vb=          " Disable ALL bells
set laststatus=2

" xterm title
set title

" convert tabs to spaces. indent level is 2
" filetype plugin indent on
set ts=2
set sw=2
set et

set showfulltag               " show full completion tags

set dictionary=/usr/share/dict/words

if $TERM =~ '^xterm' || $TERM =~ '^xterm-color' || $TERM =~ '256'
        set t_Co=256 
endif
 
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  set hlsearch
endif

if has("gui_running")
  set mousehide  " Hide mouse after chars typed
  set cursorline
  set guioptions-=T        " no toolbar
  map <MouseMiddle> <esc>"*p " paste with middle button
  set nu " it always looks fine in macvim
  set lines=40
  set columns=140
end
colorscheme default
set background=dark 

"Buffer next,previous (ctrl-{n,p})
noremap  :bn<CR>
noremap  :bp<CR>

" Don't use Ex mode, use Q for formatting
map Q gq

let maplocalleader = ","

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  filetype plugin indent on
  augroup vimrcEx
  au!
  autocmd FileType text setlocal textwidth=78
  " When editing a file, always jump to the last known cursor position.
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

" Don't write backup file for some files
au BufWrite /private/tmp/crontab.*,/tmp/crontab.*,/dev/shm/* set nowritebackup nobackup

autocmd BufReadPre,FileReadPre,BufWrite *credentials*,*authinfo*,.authinfo*,*pass,pass,pass.* set noswapfile nobackup nowritebackup

" set up syntax highlighting for my e-mail
au BufRead,BufNewFile .followup,.article,.letter,/tmp/pico*,nn.*,snd.*,mutt-*,sup.* :set ft=mail 
