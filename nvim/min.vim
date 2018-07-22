scriptencoding utf-8

let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
let $NVIM_PYTHON_LOG_LEVEL="DEBUG"

let g:python2_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" Plugins - make sure you use single quotes
filetype off
if has('nvim')
call plug#begin('~/.config/nvim/plugged')
else
call plug#begin('~/.vim/plugged')
endif

" Plug 'add/plugin-here'

call plug#end()
filetype on
