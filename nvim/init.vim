" Settings
"
if filereadable(expand('~/.config/nvim/nvim.settings'))
    source ~/.config/nvim/nvim.settings
endif

" Packages
"
if filereadable(expand('~/.config/nvim/nvim.packages'))
    source ~/.config/nvim/nvim.packages
endif

" Package settings
"
if isdirectory(expand('~/.config/nvim/vendor/'))
    for f in split(glob('~/.config/nvim/vendor/*'), '\n')
        exe 'source' f
    endfor

    au BufRead,BufNewFile ~/.config/nvim/* setlocal filetype=vim
endif

" Colors
"
if filereadable(expand('~/.config/nvim/nvim.colors'))
    source ~/.config/nvim/nvim.colors
endif
