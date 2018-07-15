" ----------------------------------------
" Editor settings
" ----------------------------------------
"
" General settings
"
	let mapleader=","      " Let's set a mapleader
	set nocompatible       " Use Vim, not Vi
	set backspace=2        " Backspace deletes like most programs in insert mode
	set nobackup
	set nowritebackup
	set noswapfile
	set history=50
	set ruler              " show cursor position all the time
	set showcmd            " display incomplete commands
	set number             " Show line numbers
	set undofile           " Persist undo across vim sessions
	set undodir=~/.config/nvim/undo " Undo directory temp files
	set winminheight=0     " completely hide split on buffer focus
	set winminwidth=0      " completely hide split on buffer focus
	set nowinfixheight     " Allow for <C-w>= for equalizing splits
	set nowinfixwidth      " Allow for <C-w>= for equalizing splits
	set relativenumber     " Count line numbers based on cursor
	set scrolloff=999      " Keep cursor in the middle of the screen
	set wm=0               " Don't wrap based on terminal size
	set clipboard=unnamed  " Needed to copy / paste from system
	set cot+=preview       " Completion preview support

	" Attempt to take care of UltiSnips errors.
	" For more information, see:
	"
	" <https://github.com/SirVer/ultisnips/issues/763>
	" <http://ricostacruz.com/til/neovim-with-python-on-osx>
	"
	let g:python2_host_prog = '/usr/local/bin/python'
	let g:python3_host_prog = '/usr/local/bin/python3'


" Zoom a vim pane, <C-w> to rebalance
"
	nnoremap <Leader>- :wincmd _<CR>:wincmd \|<CR>
	nnoremap <Leader>= :wincmd =<CR>


" Clear search results until the next search
"
	nnoremap <C-c><C-c> :noh<CR>


" Embrace the vim
"
	nnoremap <Left> :echoe "Use h"<CR>
	nnoremap <Right> :echoe "Use l"<CR>
	nnoremap <Up> :echoe "Use k"<CR>
	nnoremap <Down> :echoe "Use j"<CR>

" Switch splits using C-navigation
"
	nnoremap <C-h> <C-W><C-h>
	nnoremap <C-j> <C-W><C-j>
	nnoremap <C-k> <C-W><C-k>
	nnoremap <C-l> <C-W><C-l>


" Exit out of insert mode for terminal
"
	tnoremap <Esc> <C-\><C-n>
	nnoremap <Leader><Leader>t :terminal<CR>


" Automatically create directories if they don't exist
"
        augroup Mkdir
            autocmd!
            autocmd BufWritePre *
                \ if !isdirectory(expand("<afile>:p:h")) |
	        \     call mkdir(expand("<afile>:p:h"), "p") |
                \ endif
        augroup END


" ----------------------------------------
" Housecleaning
" ----------------------------------------
"
" Add minpac, and allow it to update itself
"
	packadd minpac
	call minpac#init()
	call minpac#add('k-takata/minpac', {'type': 'opt'})

" Handy functions for updating or cleaning out old packages
"
	command! PackUpdate call minpac#update()
	command! PackClean call minpac#clean()

" ----------------------------------------
" Plugin index (40 total plugins installed including 'minpac')
" ----------------------------------------
"
"  ## Index of plugins installed
"
"  ### General
"
"      1. 'tpope/vim-surround'
"      2. 'tpope/vim-commentary'
"      3. 'junegunn/fzf'
"      4. 'tpope/vim-dispatch'
"      5. 'radenling/vim-dispatch-neovim'
"      6. 'w0rp/ale'
"      7. 'mhinz/vim-grepper'
"      8. 'janko-m/vim-test'
"      9. 'jiangmiao/auto-pairs'
"      10. 'airblade/vim-gitgutter'
"      11. 'ludovicchabant/vim-gutentags'
"      12. 'kana/vim-textobj-user'
"      13. 'christoomey/vim-tmux-navigator'
"      14. 'christoomey/vim-tmux-runner'
"      15. 'jreybert/magit'
"      16. 'mattn/emmet-vim'
"
"  ### Language-specific
"
"  #### Elixir
"
"      17. 'tpope/vim-endwise'
"      18. 'andyl/vim-textobj-elixir'
"      19. 'slashmili/alchemist.vim'
"      20. 'elixir-editors/vim-elixir'
"
"  #### PHP
"
"      21. 'noahfrederick/vim-composer'
"      22. 'tpope/vim-projectionist'
"      23. 'noahfrederick/vim-laravel'
"
"  #### JavaScript
"
"      24. 'posva/vim-vue'
"
"  #### LESS
"
"      25. 'groenewege/vim-less'
"
"  #### Colorschemes
"
"      26. 'tomasiser/vim-code-dark'
"
"  #### ncm2
"
"      27. ncm2
"      28. roxma/nvim-yarp
"      29. ncm2/ncm2-bufword
"      30. autozimu/LanguageClient-neovim
"      31. ncm2/ncm2-ultisnips
"      32. sirver/ultisnips
"      33. ncm2/ncm2-path
"      34. ncm2/ncm2-tmux
"      35. ncm2/ncm2-tagprefix
"      36. ncm2/ncm2-cssomni
"      37. ncm2/ncm2-tern
"      38. ncm2/ncm2-html-subscope
"      39. ncm2/ncm2-abbrfuzzy
"
" ----------------------------------------
" Plugin settings
" ----------------------------------------
"
" ### General
"
" 1. Vim surround for quotes or parenthesis
"    <https://github.com/tpope/vim-surround>
"
	call minpac#add('tpope/vim-surround')


" 2. Commentary for commenting or uncommenting code
"    <https://github.com/tpope/vim-commentary>
"
	call minpac#add('tpope/vim-commentary')


" 3. FZF for fuzzy finding files
"    <https://github.com/junegunn/fzf>
"
"    @dependency 'fzf'
"
	call minpac#add('junegunn/fzf')
	nnoremap <C-p> :<C-u>FZF<CR>


" 4. Dispatch for running commands async
"    <https://github.com/tpope/vim-dispatch>
"
"    @dependency 'radenling/vim-dispatch-neovim'
"
	call minpac#add('tpope/vim-dispatch')


" 5. Run dispatch using the built-in terminal
"    <https://github.com/radenling/vim-dispatch-neovim>
"
	call minpac#add('radenling/vim-dispatch-neovim')


" 6. Linting the current file
"    <https://github.com/w0rp/ale>
"
	" stylelint - CSS / SCSS / Less <npm install -g stylelint>
	" eslint - JavaScript <npm install -g eslint>
	" prettier - JSON / GraphQL <npm install -g prettier>
	" phpcs - PHP <composer global require 'squizlabs/php_codesniffer=*'>
	"
	call minpac#add('w0rp/ale')
	let g:ale_linters = {
		\ 'javascript': ['eslint'],
		\ }
	nmap <silent> [W <Plug>(ale_first)
	nmap <silent> [w <Plug>(ale_previous)
	nmap <silent> ]w <Plug>(ale_next)
	nmap <silent> ]W <Plug>(ale_last)

	let g:ale_sign_column_always = 1
	let g:airline#extensions#ale#enabled = 1
	let g:ale_sign_error = '•'
	let g:ale_sign_warning = '•'
	highlight ALEErrorSign ctermfg=9 ctermbg=15 guifg=#C30500 guibg=#1E1E1E
	highlight ALEWarningSign ctermfg=11 ctermbg=15 guifg=#ED6237 guibg=#1E1E1E


" 7. Grepper for searching async
"    <https://github.com/mhinz/vim-grepper>
"
"    @dependency 'fzf'
"
	call minpac#add('mhinz/vim-grepper')
	let g:grepper = {}
	let g:grepper.tools = ['rg', 'grep', 'git']

	" Search for the current word
	nnoremap <Leader>* :Grepper -cword -noprompt<CR>

	" Search for the current selection
	nmap gs <plug>(GrepperOperator)
	xmap gs <plug>(GrepperOperator)


" 8. Vim-test for running tests on various testing frameworks
"    <https://github.com/janko-m/vim-test>
"
"    @dependency 'tpope/vim-dispatch'
"    @dependency 'christoomey/vim-tmux-runner'
"
	call minpac#add('janko-m/vim-test')
	let test#strategy = 'vtr'
	nmap <silent> <Leader>t :TestNearest<CR>
	nmap <silent> <Leader>T :TestFile<CR>
	nmap <silent> <Leader>a :TestSuite<CR>
	nmap <silent> <Leader>l :TestLast<CR>
	nmap <silent> <Leader>g :TestVisit<CR>


" 9. Autopairs for auto-inserting or -removing parenthesis, squiggly
"     brackets, etc.
"     <https://github.com/jiangmiao/auto-pairs>
"
	call minpac#add('jiangmiao/auto-pairs')


" 10. Gitgutter for a gutter notification of changes
"     <https://github.com/airblade/vim-gitgutter>
"
	call minpac#add('airblade/vim-gitgutter')


" 11. Gutentags for keeping tags files up-to-date
"     <https://github.com/ludovicchabant/vim-gutentags>
"
	call minpac#add('ludovicchabant/vim-gutentags')
	let g:gutentags_generate_on_empty_buffer = 1
	let g:gutentags_cache_dir = '~/.gutentags'

	let g:gutentags_project_info = []
	call add(g:gutentags_project_info, {'type': 'php', 'file': 'composer.json'})
	let g:gutentags_ctags_executable_php = 'ctags -R --language-force=php --php-kinds=cfit --output-format=u-ctags'


" 12. Create your own text objects! Used in Elixir and other deps
"     <https://github.com/kana/vim-textobj-user>
"
	call minpac#add('kana/vim-textobj-user')


" 13. Navigate tmux and vim seamlessly
"     <https://github.com/christoomey/vim-tmux-navigator>
"
	call minpac#add('christoomey/vim-tmux-navigator')


" 14. Send vim lines to tmux panes. Useful for testing within 'vim-test' using
"     the 'vtr' strategy.
"     <https://github.com/christoomey/vim-tmux-runner>
"
	call minpac#add('christoomey/vim-tmux-runner')
	map <Leader>fr :VtrFocusRunner<CR>
	nmap <C-f> :VtrSendLinesToRunner<CR>
	vmap <C-f> :VtrSendLinesToRunner<CR>


" 15. Magit for easing git workflow within vim. Based on Magit for Emacs.
"     <https://github.com/jreybert/vimagit>
"
	call minpac#add('jreybert/vimagit')


" 16. Emmet for expanding abbreviations
"     <https://github.com/mattn/emmet-vim>
"
	call minpac#add('mattn/emmet-vim')


" ### Language-specific
"
" #### Elixir
"
	au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
	au BufRead,BufNewFile *.eex set filetype=eelixir


" 17. Endwise for auto-closing `do-end` methods
"    <https://github.com/tpope/vim-endwise>
"
	call minpac#add('tpope/vim-endwise')


" 18. Add text object support for Elixir blocks
"    <https://github.com/andyl/vim-textobj-elixir>
"
"    @dependency 'kana/vim-textobj-user'
"
	call minpac#add('andyl/vim-textobj-elixir')


" 19. Alchemist for insider info about Elixir projects using ElixirSense
"    <https://github.com/slashmili/alchemist.vim>
"
	call minpac#add('slashmili/alchemist.vim')


" 20. Syntax highlighting and additional support for Elixir
"    <https://github.com/elixir-editors/vim-elixir>
"
	call minpac#add('elixir-editors/vim-elixir')


" #### PHP
"
" 21. Vim composer for navigating files via composer autoload
"     <https://github.com/noahfrederick/vim-composer>
"
	call minpac#add('noahfrederick/vim-composer')
	autocmd User Composer nmap <buffer> nf <Plug>(composer-find)
	autocmd User Composer nmap <Leader>n <Plug>(composer-use)<CR>


" 22. Projectionist for project configuration (specifically used for
"     vim-laravel)
"     <https://github.com/tpope/vim-projectionist>
"
	call minpac#add('tpope/vim-projectionist')


" 23. Vim laravel for running artisan commands in-editor
"     <https://github.com/noahfrederick/vim-laravel>
"
	call minpac#add('noahfrederick/vim-laravel')


" #### JavaScript
"
" 24. Syntax for Vue component files
"    <https://github.com/posva/vim-vue>
"
	call minpac#add('posva/vim-vue')


" #### LESS
"
" 25. Vim syntax for LESS
"    <https://github.com/groenewege/vim-less>
"
	call minpac#add('groenewege/vim-less')


" #### Colorschemes
"
" 26. Vim Code Dark Colorscheme, a riff on Visual Studio's colorscheme
"    <https://github.com/tomasiser/vim-code-dark>
"
	call minpac#add('tomasiser/vim-code-dark')
	colorscheme codedark

	" 1 - red
	" 2 - green
	" 3 - yellow
	" 4 - blue
	" 5 - magenta
	" 6 - cyan
	" 7 - white
	set colorcolumn=+1
	highlight NonText ctermbg=NONE
	highlight Comment cterm=italic
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	set termguicolors


" #### ncm2
"
" 27. ncm2
" 28. roxma/nvim-yarp
" 29. ncm2/ncm2-bufword
" 30. autozimu/LanguageClient-neovim
" 31. ncm2/ncm2-ultisnips
" 32. sirver/ultisnips
" 33. ncm2/ncm2-path
" 34. ncm2/ncm2-tmux
" 35. ncm2/ncm2-tagprefix
" 36. ncm2/ncm2-cssomni
" 37. ncm2/ncm2-tern
" 38. ncm2/ncm2-html-subscope
" 39. ncm2/ncm2-abbrfuzzy
"
    
	" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
	call minpac#add('ncm2/ncm2')
	" ncm2 requires nvim-yarp
	call minpac#add('roxma/nvim-yarp')

	autocmd BufEnter * call ncm2#enable_for_buffer()
	set completeopt=noinsert,menuone,noselect
	set shortmess+=c

	au TextChangedI * call ncm2#auto_trigger()

	inoremap <c-c> <ESC>

	" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
	inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
	inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

	call minpac#add('ncm2/ncm2-bufword')

	call minpac#add('autozimu/LanguageClient-neovim')
	let g:LanguageClient_serverCommands = {
		\ 'go': ['go-langserver'],
		\ 'rust': ['rls'],
		\ }
	let g:LanguageClient_loggingFile = '/tmp/lc.log'
	let g:LanguageClient_loggingLevel = 'DEBUG'

	" a json file with settings for go-langserver:
	" {
	" 	"initializationOptions": {
	" 		"gocodeCompletionEnabled": true,
	" 		"funcSnippetEnabled": true
	" 	}
	" }
	let g:LanguageClient_settingsPath = $WORKSPACE_DIR . '/.vim/settings.json'

	call minpac#add('ncm2/ncm2-ultisnips')
	call minpac#add('SirVer/ultisnips')

	" inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

	" c-j c-k for moving in snippet
	imap <c-u> <Plug>(ultisnips_expand)
	" let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
	let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
	let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
	let g:UltiSnipsRemoveSelectModeMappings = 0

	call minpac#add('ncm2/ncm2-path')
	call minpac#add('ncm2/ncm2-tmux')
	call minpac#add('ncm2/ncm2-tagprefix')
	call minpac#add('ncm2/ncm2-cssomni')
	call minpac#add('ncm2/ncm2-tern')
	call minpac#add('ncm2/ncm2-html-subscope')
	call minpac#add('ncm2/ncm2-abbrfuzzy')


