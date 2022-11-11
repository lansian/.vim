let g:mapleader = ' ' 
filetype plugin indent on 
packadd! matchit
inoremap jk <esc>
tnoremap <up> <Nop>
tnoremap <down> <Nop>
set nohidden
set foldlevelstart=99 
set wildmode=longest:full:list,full
set wildignorecase
set ignorecase
set smartcase
"set completeopt=menu,menuone
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set incsearch
set hlsearch
nnoremap <C-L> :nohls<cr><C-L>
cnoremap <c-a>		<home>
cnoremap <c-b>		<left>
cnoremap <c-e>		<end>
cnoremap <c-y>      <Down>
hi IncSearch term=standout cterm=NONE ctermfg=15 ctermbg=1

" text-objects.vim configs
" use N instead of l to search backwards
" needs to be a list or sourcing the script while vim is open breaks it
let g:targets_nl = ['n', 'N']
" enable growing and seeking to work on the largest available count if a too large 
" ex v100ab will select the most outer block around the cursor
" ex v100inq will select the most distant quote to the right/down (the last one in the file)
let g:targets_gracious = 1

" vim surround config
" have * surround with an /*
" ds/ deletes the included *, even though this is undocumented behavior o_O
let g:surround_42 = "/* \r */"

set keywordprg=:tab\ help
augroup kewordprgconfigs
    au!
    "open help in new tabs, unless already viewing a help file
    autocmd filetype help setlocal keywordprg=:help
    autocmd filetype vim setlocal keywordprg=:tab\ help
    autocmd TerminalOpen * if &buftype == 'terminal' | setlocal iskeyword+=- keywordprg=:tab\ term++close\ man | endif
    "autocmd TerminalOpen !man\ * if &buftype == 'terminal' | setlocal iskeyword+=- keywordprg=:tab\ term++close\ man | endif
augroup end
"cnoreabbrev <expr> help getcmdtype() == ":" && getcmdline() == 'help' ? 'tab help' : 'help'

" switching tabs qol
tnoremap <Esc>` <c-w>gt
tnoremap <Esc>~ <c-w>gT
tnoremap <Esc>1 <c-w>1gt
tnoremap <Esc>2 <c-w>2gt
tnoremap <Esc>3 <c-w>3gt
tnoremap <Esc>4 <c-w>4gt
tnoremap <Esc>5 <c-w>5gt
inoremap <Esc>` <c-\><c-n><c-w>gt
inoremap <Esc>~ <c-\><c-n><c-w>gT
inoremap <Esc>1 <c-\><c-n><c-w>1gt
inoremap <Esc>2 <c-\><c-n><c-w>2gt
inoremap <Esc>3 <c-\><c-n><c-w>3gt
inoremap <Esc>4 <c-\><c-n><c-w>4gt
inoremap <Esc>5 <c-\><c-n><c-w>5gt
nnoremap <Esc>` <c-w>gt
nnoremap <Esc>~ <c-w>gT
nnoremap <Esc>1 <c-w>1gt
nnoremap <Esc>2 <c-w>2gt
nnoremap <Esc>3 <c-w>3gt
nnoremap <Esc>4 <c-w>4gt
nnoremap <Esc>5 <c-w>5gt

" ocaml related configs
"
"augroup menhirsettings
"    au!
"    autocmd BufRead,BufNewFile *.mly nnoremap <buffer> <F8> :term menhir --interpret --interpret-show-cst %<CR>
"augroup end
"
" merlin configs
"let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"execute "set rtp+=" . g:opamshare . "/merlin/vim"
"" ocaml format configs
"set rtp^="/home/rich/.opam/4.14.0/share/ocp-indent/vim"

" git related
"
" git blame piped to error window
"
"vnoremap gb :<C-U>cexpr system('git blame -L' .. line("'<") .. ',' .. line("'>") .. ' -p ' .. expand('%'))<CR>
"set efm=%I%m%*\\s%l%*\\s%\\d%*\\s%\\d,
"        \%Cauthor%*\\s%m,
"        \%Cauthor-mail%*\\s%m,
"        \%Cauthor-time%*\\s%m,
"        \%Cauthor-tz%*\\s%m,
"        \%Ccommitter%*\\s%m,
"        \%Ccommitter-mail%*\\s%m,
"        \%Ccommitter-time%*\\s%m,
"        \%Ccommitter-tz%*\\s%m,
"        \%Csummary%*\\s%m,
"        \%Cprevious%*\\s%m,
"        \%Cboundary,
"        \%Cfilename%*\\s%f,
"        \%Z%m
"
" e.g. git blame -L2,3 -p hello
" e.g. for debugging: execute 'tab term git blame -L' . line("'<") . ',' . line("'>")  '-p' expand('%')
" unrelated useful one line: git log --graph --decorate --oneline


" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() . "\<cr>" : "\<cr>"

"let g:lsp_diagnostics_float_cursor = 0
"let g:lsp_preview_keep_focus = 0
"let g:lsp_preview_float = 0
"let g:lsp_completion_documentation_enabled = 0
"let g:lsp_diagnostics_echo_cursor = 0
"let g:lsp_hover_ui = ''
"let g:lsp_hover_ui = 'float'
let g:lsp_hover_ui = 'preview'


if executable('haskell-language-server-wrapper')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'haskell-language-server-wrapper',
        \ 'cmd': {server_info->['haskell-language-server-wrapper', '--lsp']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(
        \     lsp#utils#find_nearest_parent_file_directory(
        \         lsp#utils#get_buffer_path(),
        \         ['.cabal', 'stack.yaml', 'cabal.project', 'package.yaml', 'hie.yaml', '.git'],
        \     ))},
        \ 'whitelist': ['haskell', 'lhaskell'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    setlocal tagfunc=lsp#tagfunc
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> <Leader>h :term++close bhoogle<CR>
    nmap <buffer> <c-@> <plug>(lsp-code-action)
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    "nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gr <plug>(lsp-rename)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
    let g:lsp_format_sync_timeout = 1000
    autocmd BufWritePre <buffer> LspDocumentFormatSync
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

