" === README START ===
" My vim configuration. I put all of this in $HOME/.vim.  I then make a link
" from $HOME/.vim/vimrc to $HOME/.vimrc
"
" INSTALL:
"   * mkdir -p ~/.vim/backup
"   * wget -O ~/.vim/vimrc https://raw.github.com/taylor/vimconfig/master/vimrc
"   * vim
"
" TIPS:
"   "*p to paste from system copy buffer
"   use ^P/^N in insert mode to complete words
"   ^] to jump to tags
"   ^W s,^W v - split windows
"   gt/gT switching between tabs (or use mappings below)
"   f<letter> / t<letter> - jump to next letter or before letter
"   gv - highlight last visual
"   gg=G - Indent the whole file *********
"   gc - comment
"   ^c^c - slime
"
"   For trac.vim:
"               :TWOpen <WikiPage>    - Open the wiki View
"               :TWSave "<Comment>"   - Saves the Active Wiki Page
"
"   NERDTree and Taglist:
"      " ,tt will toggle taglist on and off
"      nmap <LocalLeader>tt :Tlist<cr>
"      " ,nn will toggle NERDTree on and off
"      nmap <LocalLeader>nn :NERDTreeToggle<cr>
"      nmap ,nn :NERDTreeToggle<cr>
"      map <leader>n :NERDTreeToggle<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible

" Download statusline config
if !filereadable(expand("$HOME/.vim/vimrc-statusline"))
  echo "Installing statuline config..."
  echo ""
  execute 'silent !curl -kqs -o "' . expand('$HOME/.vim/vimrc-statusline') . '" https://raw.github.com/taylor/vimconfig/master/vimrc-statusline'
endif

" Install Vundle plugin manager
let has_vundle=1
if !filereadable(expand("$HOME/.vim/bundle/vundle/autoload/vundle.vim"))
    echo "Installing Vundle..."
    echo ""
    if isdirectory(expand('$HOME/.vim/bundle')) == 0
        call mkdir(expand('$HOME/.vim/bundle'), 'p')
    endif
    execute 'silent !git clone https://github.com/gmarik/vundle "' . expand('$HOME/.vim/bundle/vundle') . '"'
    let has_vundle=0
endif

" Use pathogen if installed
if filereadable(expand("$HOME/.vim/bundle/vim-pathogen/autoload/pathogen.vim"))
  source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim
  call pathogen#infect()
endif

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-pathogen'

"" === Utils
Bundle 'MarcWeber/vim-addon-mw-utils'

"" === Development
Bundle 'scrooloose/syntastic'
"Bundle 'msanders/snipmate.vim'
"Bundle 'garbas/vim-snipmate'
"Bundle 'MarcWebe/UltiSnips'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'tomtom/tlib_vim'
Bundle 'BjRo/vim-extest'
Bundle 'carlosgaldino/elixir-snippets'
"Bundle 'taylor/vim-ixxspec' " run specs in tmux
"Bundle 'sunaku/vim-ruby-minitest'
"Bundle 'duskhacker/sweet-rspec-vim'
"TEMP Bundle 'gregsexton/gitv' " gitk like thing for vim
Bundle 'xaviershay/tslime.vim'
"Bundle 'actionshrimp/vim-xpath'
Bundle 'tomtom/tcomment_vim'
"Bundle 'ianremmler/comment' " Code comments
"Bundle 'scrooloose/nerdcommenter'
"Bundle 'sukima/xmledit'
Bundle 'vim-scripts/Align'
" Git
Bundle 'tpope/vim-fugitive'

"" === Syntax
"TEMP Bundle 'tpope/vim-cucumber' " cucumber syntax
"TEMP Bundle 'taylor/vim-mswebdev' " ms web dev syntax crap
Bundle 'mjwall/clj-vim'
Bundle 'elixir-lang/vim-elixir'
Bundle 'heartsentwined/vim-ember-script'
Bundle 'httplog'

"" === Color schemes
"colors-bnelson-less -- UNKNOWN
Bundle 'rking/vim-detailed'
"Bundle 'git@bitbucket.org:kisom/eink.vim.git'
Bundle 'chmllr/vim-colorscheme-elrodeo'
Bundle 'ianremmler/frood'
Bundle 'nielsmadan/harlequin'
"colors-ixxcolors -- UNKNOWN
"colors-lettuce -- UNKNOWN
Bundle 'plynch/maltese'
"colors-misc -- UNKNOWN
"colors-smyck -- UNKNOWN
Bundle 'altercation/vim-colors-solarized'
"colors-syntaxless-kyle -- UNKNOWN
Bundle 'tir_black'
Bundle 'nanotech/jellybeans.vim'
"colors-vayn-schemes -- UNKNOWN

" More look and feel
"Bundle 'Lokaltog/vim-powerline'
Bundle 'itchyny/lightline.vim'
Bundle 'itchyny/landscape.vim'

"" === Pairing
"Bundle 'Floobits/floobits-vim'
"mail-notmuch -- UNKNOWN
"misc-taylor -- UNKNOWN
"syntax-tmux -- UNKNOWN
"utils-conque_2.3 -- UNKNOWN

" Extra functionality
"Bundle 'Valloric/YouCompleteMe'
Bundle 'taylor/vim-zoomwin'
"Bundle 'maba/vim-markdown-preview'
Bundle 'kien/ctrlp.vim'
"utils-fuzzyfinder -- UNKNOWN
Bundle 'mattn/gist-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
"Bundle 'nixternal/taskwarrior-vim'
Bundle 'vim-scripts/Conque-Shell'

"utils-l9 -- UNKNOWN
"utils-tracwiki -- UNKNOWN
Bundle 'http://repo.or.cz/r/vcscommand.git'
"Bundle 'nsmgr8/vitra' "-- Trac UI
"Bundle 'mattn/webapi-vim' "-- used by gist, vitra, etc
Bundle 'mattn/webapi-vim'
Bundle 'smerrill/vagrant-vim'
Bundle 'expelledboy/vim-erl-mode'
"Bundle 'tpope/vim-five'
Bundle 'taq/vim-git-branch-info'
Bundle 'git://gitorious.org/vim-gnupg/vim-gnupg.git'
"vim-pandoc -- 

if has_vundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

"" === Bundles not available on github or else where
"   taglist.vim - http://www.vim.org/scripts/script.php?script_id=273
let taglist_url = "http://vim.sourceforge.net/scripts/download_script.php?src_id=19574"
if !filereadable(expand("$HOME/.vim/bundle/taglist/plugin/taglist.vim"))
  echo "Installing taglist.vim"
  execute 'silent !mkdir -p "' . expand("$HOME/.vim/bundle/taglist/") . '"'
  execute 'silent !wget -O taglist.zip "' . taglist_url . '"'
  execute 'silent !unzip taglist.zip -d "' . expand("$HOME/.vim/bundle/taglist/") . '"'
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
syntax on
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set scrolloff=3 " lines above/below cursor

"set mouse=n
"set clipboard+=unnamed  " Yanks go on clipboard instead.
set timeoutlen=450  " Time to wait after ESC (default causes an annoying delay)

" first the disabled features due to security concerns
set modelines=0               " no modelines [http://www.guninski.com/vim1.html]
let g:secure_modelines_verbose=0 " securemodelines vimscript
let g:secure_modelines_modelines = 15 " 15 available modelines


set splitbelow " split below w/focus
set splitright " split right w/focus
set history=1000
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
"set nu " line numbers
set backspace=indent,eol,start
set noerrorbells
set visualbell t_vb=          " Disable ALL bells

" xterm title
set title

" convert tabs to spaces. indent level is 2
" filetype plugin indent on
set ts=2
set sw=2
set et

set showfulltag               " show full completion tags
"set wildignore+=*.o,*~,.lo    " ignore object files
"set wildmode=longest:full
"set wildmenu                  " menu has tab completion
"set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion

set ttyfast

set dictionary=/usr/share/dict/words

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
  set backupdir=~/.vim/backup
endif


" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  set hlsearch
endif

" Ctrl-/ will turn off highlight (until next search)
map <silent> :noh<cr>

" toggle paste
set pastetoggle=<C-\\>
"nmap <leader>P :set invpaste<CR>
"imap <leader>P :set invpaste<CR>
"nmap <C-\\> :set invpaste<CR>
"imap <C-\\> :set invpaste<CR>

" Move faster
map <C-j> <C-d>
map <C-k> <C-u>

set background=dark 
if $TERM =~ '256'
  set t_Co=256
  if has("gui_running")
    set mousehide  " Hide mouse after chars typed
    set cursorline
    let g:solarized_termcolors=256
    set guioptions-=T        " no toolbar
    colorscheme solarized
    map <MouseMiddle> <esc>"*p " paste with middle button
    set nu " it always looks fine in macvim
    set lines=40
    set columns=140
  else
    colorscheme landscape
  end
elseif $TERM =~ '^xterm-'
  set t_Co=16
  colorscheme landscape
elseif $TERM =~ '^xterm$'
  set t_Co=8
  colorscheme frood
endif

"autocmd InsertEnter * set cul cuc
"autocmd InsertLeave * set nocul nocuc
"autocmd FocusGained * set cul cuc
"autocmd FocusLost * set nocul nocuc
     

" If I forgot to sudo vim a file, do that with :w!!
cmap w!! %!sudo tee > /dev/null %

"noremap <F5> :w<CR>
"imap <F5> <ESC>:w<CR>

"noremap <D-r> :!ruby %<CR>
"map <leader>r :!ruby %<CR>

"Buffer next,previous (ctrl-{n,p})
"noremap  :bn<CR>
"noremap  :bp<CR>


""netrw stuff
"" http://mysite.verizon.net/astronaut/vim/index.html#NETRW
"" 
"let g:netrw_altv          = 1
"let g:netrw_fastbrowse    = 2
"let g:netrw_keepdir       = 0
"let g:netrw_liststyle     = 2
"let g:netrw_retmap        = 1
"let g:netrw_silent        = 1
"let g:netrw_special_syntax= 1

" Don't use Ex mode, use Q for formatting
map Q gq

let maplocalleader = ","

" Make ',e' (in normal mode) give a prompt for opening files
" " in the same dir as the current buffer's file.
if has("unix")
  map <LocalLeader>e :e <C-R>=expand("%:p:h") . "/" <CR>
else
  map <LocalLeader>e :e <C-R>=expand("%:p:h") . "\\" <CR>
endif

" vim trac plugin
let g:tracServerList = {}       
if filereadable(expand("$HOME/.vim/tracserverlist"))
  source ~/.vim/tracserverlist
endif

" ---------------------------------------------------------------------------
" tabs
" (LocalLeader is ",")
map <LocalLeader>tc :tabnew<cr>    " create a new tab       
map <LocalLeader>tC :tabnew %<cr>    " create a new tab       
"map <LocalLeader>td :tabclose<cr>    " close a tab
map <LocalLeader>tq :tabclose<cr>    " close a tab
map <LocalLeader>tn :tabnext<cr>     " next tab
map <LocalLeader>tp :tabprev<cr>     " previous tab
map <LocalLeader>tm :tabmove         " move a tab to a new location

" fuzzy finder textmate
if has("ruby")
  "map <leader>f :FuzzyFinderTextMate<CR>
  map <leader>f :FufFile<CR>

  " Autocomplete
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  "improve autocomplete menu color
  highlight Pmenu ctermbg=238 gui=bold
else
  map <leader>f :FuzzyFinderFile<CR>
end

" BufExplorer
map <LocalLeader>bb :BufExplorer<CR>
 
" ---------------------------------------------------------------------------
"  configuration for fuzzyfinder
" find in buffer is ,fb
nmap <LocalLeader>fb :FuzzyFinderBuffer<CR>
" find in file is ,ff
nmap <LocalLeader>ff :FufFileWithCurrentBufferDir<CR>
"nmap <LocalLeader>ff :FufFile<CR>
"nmap <LocalLeader>ff :FuzzyFinderFile<CR>
" find in tag is ,ft
nmap <LocalLeader>ft :FufBufferTag<CR>
"nmap <LocalLeader>ft :FuzzyFinderTag<CR>

" ---------------------------------------------------------------------------
" Settings for gist.vim
if has("mac")
  let g:gist_clip_command = 'pbcopy'
else
  let g:gist_clip_command = 'xclip'
end
let g:gist_detect_filetype = 1

" ---------------------------------------------------------------------------
" Settings for taglist.vim
let Tlist_Use_Right_Window=1
let Tlist_Auto_Open=0
let Tlist_Enable_Fold_Column=0
let Tlist_Compact_Format=0
let Tlist_WinWidth=28
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close = 1

map <leader>Tf :ExTestRunFile<CR>
map <leader>Tm :ExTestRunMethod<CR>
map <leader>Tl :ExTestRunLast<CR>
let g:extest_exunit_run_file_cmd = "mix test '%f'"
let g:extest_exunit_run_test_cmd = "mix test '%f'"
"let g:extest_amrita_run_file_cmd = "mix amrita '%f'"
"let g:extest_amrita_run_test_cmd = "mix amrita '%f:%l'"

if version >= 700
  let NERDTreeIgnore=['\~$', '^\.git', '\.swp$', '\.DS_Store$']
  let NERDTreeShowHidden=1

  " ,tt will toggle taglist on and off
  nmap <LocalLeader>tt :Tlist<cr>
  " ,nn will toggle NERDTree on and off
  nmap <LocalLeader>nn :NERDTreeTabsToggle<cr>
  nmap ,nn :NERDTreeTabsToggle<cr>
  "map <leader>n :NERDTreeTabsToggle<cr>
end

let g:ConqueTerm_ReadUnfocused = 1

nmap <LocalLeader>zz :ZoomWin<cr>
nmap <c-w>z :ZoomWin<CR>

compiler ruby
"compiler python

 "For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
 "let &guioptions = substitute(&guioptions, "t", "", "g")

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp
"

map <buffer> <Leader>mp :Mm<CR>
" Markdown -- added *.md, because I do not care about modula2
augroup mkd
  autocmd BufRead *.mkd,*.md,*.markdown      set ai formatoptions=tcroqn2 comments=n:> ft=markdown
augroup END

"set cinoptions=:0,p0,t0
"set cinwords=if,else,while,do,for,switch,case

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

" Don't write backup file for some files
au BufWrite /private/tmp/crontab.*,/tmp/crontab.*,/dev/shm/* set nowritebackup nobackup

" We don't want a swap file and backup for these "private" files
autocmd BufReadPre,FileReadPre,BufWrite *encrypted*,*credentials*,*authinfo*,.authinfo*,*pass,pass,pass.*,*private*,.chef/*,~/.mutt/private/*,~/.vim/tracserverlist set viminfo= nowritebackup nobackup noswapfile

" set up syntax highlighting for my e-mail
au BufRead,BufNewFile .followup,.article,.letter,/tmp/pico*,nn.*,snd.*,/tmp/mutt*,sup.* :set ft=mail 

" VimClojure
let vimclojure#HighlightBuiltins = 1
let vimclojure#ParenRainbow = 1

set tags+=gems.tags 

" spell checking
" text & mutt files
au BufNewFile,BufRead /tmp/mutt*,/tmp/cvs*,*.txt set tw=72 noai noshowmatch
au BufNewFile,BufRead /tmp/mutt*,/tmp/cvs*,*.txt setlocal spell spelllang=en_us
au BufNewFile,BufRead /tmp/mutt*,/tmp/cvs*,*.txt syntax off
" git commits
au BufNewFile,BufRead *.git/COMMIT_EDITMSG set tw=72 noai noshowmatch
au BufNewFile,BufRead *.git/COMMIT_EDITMSG setlocal spell spelllang=en_us

" Elixir eex files until they fix syntax
au BufNewFile,BufRead *.eex set ft=html

autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syntax clear | endif

set foldlevelstart=99

"noremap  :bn<CR>
"noremap  :bp<CR>

so ~/.vim/vimrc-statusline
