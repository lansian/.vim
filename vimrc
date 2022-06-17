let g:mapleader = ' '
filetype plugin on 

augroup mansettings
    au!
    "autocmd TerminalOpen !man\ * if &buftype == 'terminal' | setlocal iskeyword+=- keywordprg=:tab\ term++close\ man | endif
    autocmd TerminalOpen * if &buftype == 'terminal' | setlocal iskeyword+=- keywordprg=:tab\ term++close\ man | endif
augroup end

"open help in new tabs, unless already viewing a help file
set keywordprg=:tab\ help
augroup helpsettings
    au!
    autocmd filetype help setlocal keywordprg=:help
    autocmd filetype vim setlocal keywordprg=:tab\ help
augroup end
"cnoreabbrev <expr> help getcmdtype() == ":" && getcmdline() == 'help' ? 'tab help' : 'help'

augroup templates
    au!
    autocmd bufnewfile  *.java 0r ~/.vim/templates/skeleton.java 
                               \ | %s/class_name/\=expand('%:t:r')/g
augroup end

inoremap jk <esc>
set foldlevelstart=99 
set wildmode=list:lastused:longest,full
set ignorecase
set smartcase
"set completeopt=menu,menuone,noinsert,noselect 
set completeopt=menu,menuone
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr-o:hor20
		  \,a:blinkwait700-blinkoff400-blinkon250
     	  \,sm:block-blinkwait175-blinkoff150-blinkon175

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

cnoremap <c-a>		<home>
cnoremap <c-b>		<left>
"cnoremap <c-d>		<del>
cnoremap <c-e>		<end>
cnoremap <c-n>		<down>
cnoremap <C-P>		<Up>
