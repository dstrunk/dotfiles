" Be a nice member of the PHP community
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab
setlocal autoindent
setlocal copyindent
setlocal smarttab

" Ignore certain files for CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**

" Let's run PHPUnit tests
function! RunPHPUnitTest()
  cd %:p:h
  let result = system("phpunit " . bufname("%"))
  split __PHPUnit_Result__
  normal! ggdG
  setlocal buftype=nofile
  call VtrSendCommandToRunner! append(0, split(result, '\v\n'))
  cd -
endfunction

map <leader>t :call RunPHPUnitTest()<cr>

" Snippets
:UltiSnipsAddFiletypes php
:UltiSnipsAddFiletypes php-laravel
:UltiSnipsAddFiletypes php-phpunit
:UltiSnipsAddFiletypes php-symfony2
