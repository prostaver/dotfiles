set tabstop=4 shiftwidth=4 softtabstop=4 expandtab autoindent smartindent
setlocal colorcolumn=80

setlocal path=.,**,src/**
" setlocal wildignore=*.pyc,*/__pycache__/*,*/env/*,*/venv/*,*/.env/*,*/.venv/*

" set include=^\\s*\\(from\\\|import\\)\\s*\\zs\\(\\S\\+\\s\\{-}\\)*\\ze\\(\\S\\+\\s\\{-}\\)*\\ze\\($\\\|\ as\\)
" function! PyInclude(fname)
"     let parts = split(a:fname, ' import ')
"     let l = parts[0]
"     if len(parts) > 1
"         let r = parts[1]
"         let joined = join([l,r], '.')
"         let fp = substitute(joined, '\.', '/', 'g') . '.py'
"         let found = glob(fp, 1)
"         if len(found)
"             return found
"         endif
"     endif
"     return substitute(l, '\.', '/', 'g') . '.py'
" endfunction
" setlocal includeexpr=PyInclude(v:fname)
" setlocal define=^\\s*\\<\\(def\\\|class\\)\\>
