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

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

autocmd BufEnter * call ncm2#enable_for_buffer()
set shortmess+=c
inoremap <C-c> <ESC>

au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
au User Ncm2PopupClose set completeopt=menuone

Plug 'ncm2/ncm2-path'

call plug#end()
filetype on
