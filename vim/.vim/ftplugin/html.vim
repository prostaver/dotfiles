set autoread

nnoremap ,html :-1r ~/.vim/snippets/html/html_skeleton.html<CR>/<\/title<CR>i

autocmd! BufWritePost * silent! !prettier -w <afile>
autocmd BufWritePost * redraw!
