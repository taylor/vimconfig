" if filereadable(expand("$HOME/.vim/testingstuff-plugins.vim"))
"   source ~/.vim/testingstuff-plugins.vim
" endif
" call vundle#begin()
" Plugin 'junegunn/limelight.vim'
" Plugin 'terryma/vim-expand-region'
" Plugin 'mhinz/vim-signify'
" Plugin 'vim-scripts/diffchar.vim'
" call vundle#end()




let mapleader = "\<Space>"
"let mapleader = "\<DEL>"

nnoremap <Leader>h <C-W>h
nnoremap <Leader>j <C-W>j
nnoremap <Leader>k <C-W>k
nnoremap <Leader>l <C-W>l
" nnoremap <Leader>\| :vsplit<CR>
" nnoremap <Leader>- :split<CR>

nnoremap <Leader>n :NERDTreeTabsToggle<CR>
nnoremap <Leader>o :NERDTreeTabsToggle<CR>
nnoremap <Leader>w :w<CR>

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" visual line mode
nmap <Leader><Leader> V

"Plugin 'terryma/vim-expand-region'
" visual highlighting done easy: v v v
" v one char, vv to get a word, vvv to get paragraph
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" select text you just pasted
noremap gV `[v`]

"" vp doesn't replace paste buffer
" function! RestoreRegister()
"   let @" = s:restore_reg
"   return ''
" endfunction
" function! s:Repl()
"   let s:restore_reg = @"
"   return "p@=RestoreRegister()\<cr>"
" endfunction
" vmap <silent> <expr> p <sid>Repl()


let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude=vendor/ --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0

nmap <Leader>z :ZoomWin<cr>

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7
