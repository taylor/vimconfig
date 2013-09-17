" === README START ===
" My vim configuration. I put all of this in $HOME/.vim.  I then make a link
" from $HOME/.vim/vimrc to $HOME/.vimrc
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
"   From: trac.vim
"               :TWOpen <WikiPage>    - Open the wiki View
"               :TWSave "<Comment>"   - Saves the Active Wiki Page
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Based on many different vimrc files including the one from Bram@vim.org as
" well as
" 
"   http://dotfiles.org/~dakrone/.vimrc
"   http://blog.infinitered.com/entries/show/9
"
" Uses many plugins including
"
"   pathogen - https://github.com/tpope/vim-pathogen
"   FuzzyFinder_Textmate - http://weblog.jamisbuck.org/2008/10/10/coming-home-to-vim
"   FuzzyFinder - http://www.vim.org/scripts/script.php?script_id=1984
"   netrw - write over net - http://www.vim.org/scripts/script.php?script_id=1075
"   ZoomWin -  http://vim.sourceforge.net/scripts/download_script.php?src_id=9865
"   ToggleWinLayout - http://mysite.verizon.net/astronaut/vim/index.html#TWL
"   taglist.vim - http://www.vim.org/scripts/script.php?script_id=273
"   Buffer Explorer - http://www.vim.org/scripts/script.php?script_id=42 
"   NERD Tree - http://www.vim.org/scripts/script.php?script_id=1658
"   rails.vim - http://www.vim.org/scripts/script.php?script_id=1567
"   vim-ruby - http://vim-ruby.rubyforge.org/
"     rubycomplete - http://www.vim.org/scripts/script.php?script_id=1662
"   vim-cucumber - http://github.com/tpope/vim-cucumber
"   SuperTab - http://www.vim.org/scripts/script.php?script_id=1643
"   Git Branch Info - http://www.vim.org/scripts/script.php?script_id=2258
"   or
"   http://lumberjaph.net/blog/index.php/2008/06/26/git-branch-everywhere/
"   Gist.vim - http://www.vim.org/scripts/script.php?script_id=2423
"   tComment - Add comments to code -    http://www.vim.org/scripts/script.php?script_id=1173
"   cucumber.vim - syntax etc for cucumber step and feature files
"   vimtrac plugin - http://www.vim.org/scripts/script.php?script_id=2147 -  http://www.ascetinteractive.com.au/vimtrac
"   vim-detailed - a real 256 color scheme -- https://github.com/rking/vim-detailed
"
" Also see
"   ruby test from vim - http://po-ru.com/diary/running-ruby-tests-from-vim/
"   specky - http://projects.martini.nu/specky/ (RSpec integration)
"   gitdiff - http://www.vim.org/scripts/script.php?script_id=1846
"     or http://tekrat.com/2008/02/21/vim-diff/
"   http://whynotwiki.com/Editing_Ruby_code_in_vim
"   http://www.cuberick.com/2008/10/ruby-autocomplete-in-vim.html
"   http://make-believe.org/in-words/post/vim-is-forever
"   vcscommand.vim
"   Python menus and syntax
"     http://www.vim.org/scripts/script.php?script_id=30
"     http://www.vim.org/scripts/script.php?script_id=790
"   
"   Folding
"     http://eigenclass.org/hiki/Usable+Ruby+folding+for+Vim
"
" === README END ===

set nocompatible

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

if filereadable(expand("$HOME/.vim/bundle/vim-pathogen/autoload/pathogen.vim"))
  source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim
  call pathogen#infect()
endif

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-pathogen'

"" === Development
"Bundle 'msanders/snipmate.vim'
"Bundle 'carlosgaldino/elixir-snippets'
"Bundle 'ianremmler/comment' " Code comments
"Bundle 'taylor/vim-ixxspec' " run specs in tmux
"Bundle 'sunaku/vim-ruby-minitest'
"Bundle 'duskhacker/sweet-rspec-vim'
"TEMP Bundle 'gregsexton/gitv' " gitk like thing for vim
Bundle 'xaviershay/tslime.vim'
"Bundle 'actionshrimp/vim-xpath'
Bundle 'tomtom/tcomment_vim'
"Bundle 'sukima/xmledit'

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
Bundle 'git@bitbucket.org:kisom/eink.vim.git'
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
"colors-vayn-schemes -- UNKNOWN

" More look and feel
Bundle 'Lokaltog/vim-powerline'

"" === Pairing
Bundle 'Floobits/floobits-vim'
"mail-notmuch -- UNKNOWN
"misc-taylor -- UNKNOWN
"syntax-tmux -- UNKNOWN
"utils-conque_2.3 -- UNKNOWN

" Extra functionality
Bundle 'taylor/vim-zoomwin'
"Bundle 'maba/vim-markdown-preview'
"Bundle 'kien/ctrlp.vim'
"utils-fuzzyfinder -- UNKNOWN
Bundle 'mattn/gist-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
"Bundle 'nixternal/taskwarrior-vim'

"utils-l9 -- UNKNOWN
"utils-tracwiki -- UNKNOWN
Bundle 'http://repo.or.cz/r/vcscommand.git'
"Bundle 'nsmgr8/vitra' "-- Trac UI
"Bundle 'mattn/webapi-vim'
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

filetype plugin indent on

"set mouse=n
"set clipboard+=unnamed  " Yanks go on clipboard instead.
set timeoutlen=450  " Time to wait after ESC (default causes an annoying delay)

" first the disabled features due to security concerns
set modelines=0               " no modelines [http://www.guninski.com/vim1.html]
let g:secure_modelines_verbose=0 " securemodelines vimscript
let g:secure_modelines_modelines = 15 " 15 available modelines

set nocompatible
syntax on
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

" Local configuration
" set runtimepath=~/.vim,/etc/vim,/usr/share/vim/vimfiles
" set runtimepath+=/usr/share/vim/addons,/usr/share/vim/vim61
" set runtimepath+=/usr/share/vim/vimfiles/after,~/.vim/after

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
    colorscheme frood
  end
elseif $TERM =~ '^xterm-'
  set t_Co=16
  colorscheme frood
elseif $TERM =~ '^xterm$'
  set t_Co=8
  colorscheme frood
endif

" If I forgot to sudo vim a file, do that with :w!!
cmap w!! %!sudo tee > /dev/null %

"noremap <F5> :w<CR>
"imap <F5> <ESC>:w<CR>

noremap <D-r> :!ruby %<CR>
map <leader>r :!ruby %<CR>

"Buffer next,previous (ctrl-{n,p})
noremap  :bn<CR>
noremap  :bp<CR>


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

"source ~/.vim/vim7.vim

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

nmap <LocalLeader>zz :ZoomWin<cr>
nmap <c-w>z :ZoomWin<CR>

compiler ruby
"compiler python

set laststatus=2


if has('statusline')
        " Status line detail: (from Rafael Garcia-Suarez)
        " %f		file path
        " %y		file type between braces (if defined)
        " %([%R%M]%)	read-only, modified and modifiable flags between braces
        " %{'!'[&ff=='default_file_format']}
        "			shows a '!' if the file format is not the platform
        "			default
        " %{'$'[!&list]}	shows a '*' if in list mode
        " %{'~'[&pm=='']}	shows a '~' if in patchmode
        " (%{synIDattr(synID(line('.'),col('.'),0),'name')})
        "			only for debug : display the current syntax item name
        " %=		right-align following items
        " #%n		buffer number
        " %l/%L,%c%V	line number, total number of lines, and column number
        "function! SetStatusLineStyle()
        "        if &stl == '' || &stl =~ 'synID'
        "                let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}" .
        "                                        \"%{'~'[&pm=='']}"                     .
        "                                        \"%=#%n %l/%L,%c%V "                   .
        "                                        \"git:%{call GitBranch()}"
        "        else
        "                let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}" .
        "                                        \" (%{synIDattr(synID(line('.'),col('.'),0),'name')})" .
        "                                        \"%=#%n %l/%L,%c%V "
        "        endif
        "endfunc
        "call SetStatusLineStyle()

        if has("ruby")
          let g:git_branch_status_head_current=1
          let g:git_branch_status_ignore_remotes=1
          let g:git_branch_status_text=""
        
          function! SetStatusLineStyle()
                  let &stl="%f %y "                       .
                          \"%([%R%M]%)"                   .
                          \"%#StatusLineNC#%{&ff=='unix'?'':&ff.'\ format'}%*" .
                          \"%{'$'[!&list]}"               .
                          \"%{'~'[&pm=='']}"              .
                          \"%="                           .
                          \"#%n %l/%L,%c%V "              .
                          \"git:%{GitBranchInfoString()} "
                          "\"%{rvm#statusline()} " .
  "      \"%#StatusLineNC#%{GitBranchInfoString()}%* " .
          endfunc
        else
          function! SetStatusLineStyle()
                  let &stl="%f %y "                       .
                          \"%([%R%M]%)"                   .
                          \"%#StatusLineNC#%{&ff=='unix'?'':&ff.'\ format'}%*" .
                          \"%{'$'[!&list]}"               .
                          \"%{'~'[&pm=='']}"              .
                          \"%="                           .
                          \"#%n %l/%L,%c%V "
          endfunc
        end
        call SetStatusLineStyle()

        if has('title')
                set titlestring=%t%(\ [%R%M]%)
        endif

        "highlight StatusLine    ctermfg=White ctermbg=DarkBlue cterm=bold
        "highlight StatusLineNC  ctermfg=White ctermbg=DarkBlue cterm=NONE
endif

"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P


 "For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
 "let &guioptions = substitute(&guioptions, "t", "", "g")


" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp
"

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

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
    \   exe "normal g`\"" |
    \ endif

  augroup END

else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

" Don't write backup file for some files
au BufWrite /private/tmp/crontab.*,/tmp/crontab.*,/dev/shm/* set nowritebackup nobackup

" We don't want a swap file and backup for these "private" files
autocmd BufReadPre,FileReadPre ~/.mutt/private/* set viminfo= noswapfile nowritebackup

autocmd BufReadPre,FileReadPre,BufWrite ~/.vim/tracserverlist set noswapfile nobackup nowritebackup

autocmd BufReadPre,FileReadPre,BufWrite *encrypted*,*credentials*,*authinfo*,.authinfo*,*pass,pass,pass.*,*private*,.chef/* set viminfo= nowritebackup nobackup noswapfile

"autocmd BufNewFile,BufRead *.vb set ft=vbnet
"autocmd BufNewFile,BufRead *.aspx set ft=aspnet

" set up syntax highlighting for my e-mail
au BufRead,BufNewFile .followup,.article,.letter,/tmp/pico*,nn.*,snd.*,/tmp/mutt*,sup.* :set ft=mail 

"so ~/.vim/gpg_files

"au FocusLost * silent! wa
"au FocusGained * echo "welcome back"


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

noremap  :bn<CR>
noremap  :bp<CR>
