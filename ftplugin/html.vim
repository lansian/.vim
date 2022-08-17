setlocal foldmethod=indent
setlocal iskeyword+=-
setlocal keywordprg=firefox\ www.google.com/search?q=mdn+html\
set makeprg=firefox
nnoremap <buffer> <F9> :make %<CR>
