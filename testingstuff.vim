let mapleader = "\<Space>"
"let mapleader = "\<DEL>"

nnoremap <Leader>h <C-W>h
nnoremap <Leader>j <C-W>j
nnoremap <Leader>k <C-W>k
nnoremap <Leader>l <C-W>l
" nnoremap <Leader>\| :vsplit<CR>
" nnoremap <Leader>- :split<CR>

noremap <Leader>n :NERDTreeTabsToggle<CR>
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

"Bundle 'terryma/vim-expand-region'
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
