" Be a nice member of the PHP community
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab
setlocal autoindent
setlocal copyindent
setlocal smarttab
setlocal iskeyword+=-
setlocal iskeyword+=_

" Ignore certain files for CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**
set wildignore+=*/media

" Snippets
:UltiSnipsAddFiletypes php
:UltiSnipsAddFiletypes php-laravel
:UltiSnipsAddFiletypes php-phpunit
:UltiSnipsAddFiletypes php-symfony2

" autocomplete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
let g:phpcomplete_relax_static_constraint=1
let g:phpcomplete_complete_for_unknown_classes=1
let g:phpcomplete_search_tags_for_variables=1
let g:phpcomplete_parse_docblock_comments=1

" trim white space
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

autocmd! BufWritePre *.php :call TrimWhiteSpace()

" PHP CS fixer
let g:php_cs_fixer_level = "symfony"
let g:php_cs_fixer_config = "default"
let g:php_cs_fixer_php_path = "~/.bin/php-cs-fixer"

nnoremap <silent><C-b> :call PhpCsFixerFixFile()<CR>

" <3 PHP namespaces
set tags+=.git/tags

if exists('*IPhpInsertUse')
	finish
endif
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a', 'n')
endfunction
inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
noremap <Leader>n :call PhpInsertUse()<CR>

if exists('*IPhpExpandClass')
	finish
endif
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
noremap <Leader>nf :call PhpExpandClass()<CR>

" Sort PHP use statements
" http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>
