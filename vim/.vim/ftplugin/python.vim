" Python specific config
" let g:ale_completion_enabled = 1
" let g:ale_linters = {'python': ['jedils','flake8']}
" let g:ale_fixers = {'python': ['black']}
" let g:ale_fix_on_save = 1
" let g:ale_python_auto_virtualenv = 1

nnoremap <F5> :!python %<CR>

setlocal path=.,**
setlocal wildignore=*.pyc,*/__pycache__/*,*/env/*,*/venv/*,*/.env/*,*/.venv/*
set autoread

let g:lsp_settings = {
            \    'pylsp-all': {
            \        'workspace_config': {
            \            'pylsp': {
            \                'configurationSources': ['ruff']
            \            }
            \        }
            \    }
            \}

autocmd! BufWritePost * silent! !ruff format <afile>
autocmd BufWritePost * redraw!
