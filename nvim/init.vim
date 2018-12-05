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


" Zoom a vim pane, <C-w> to rebalance
"
	nnoremap <Leader>- :wincmd _<CR>:wincmd \|<CR>
	nnoremap <Leader>= :wincmd =<CR>


" Clear search results until the next search
"
	nnoremap <C-c><C-c> :noh<CR>


" Switch between the last two files
"
	nnoremap <Leader><Leader> <C-^>


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
"      15. 'tpope/vim-fugitive'
"      16. 'mattn/emmet-vim'
"      17. 'yssl/QFEnter'
"      18. 'tpope/vim-repeat'
"      19. 'rizzatti/dash.vim'
"      20. 'chew-z/itunes.vim'
"      21. 'wakatime/vim-wakatime'
"      22. 'avan/vim-closetag'
"
"  ### Language-specific
"
"  #### Elixir
"
"      23. 'tpope/vim-endwise'
"      24. 'andyl/vim-textobj-elixir'
"      25. 'slashmili/alchemist.vim'
"      26. 'elixir-editors/vim-elixir'
"
"  #### PHP
"
"      27. 'noahfrederick/vim-composer'
"      28. 'tpope/vim-projectionist'
"      29. 'noahfrederick/vim-laravel'
"      30. 'jwalton512/vim-blade'
"      31. 'vim-vdebug/vdebug'
"
"  #### JavaScript
"
"      32. 'posva/vim-vue'
"      33. 'jparise/vim-graphql'
"      34. 'pangloss/vim-javascript'
"      35. 'mxw/vim-jsx'
"      36. 'leafgarland/typescript-vim'
"      37. 'Quramy/tsuquyomi'
"
"  #### LESS
"
"      38. 'groenewege/vim-less'
"
"  #### Colorschemes
"
"      39. 'tomasiser/vim-code-dark'
"
"  #### ncm2
"
"     40. ncm2
"     41. roxma/nvim-yarp
"     42. ncm2/ncm2-bufword
"     43. autozimu/LanguageClient-neovim
"     44. ncm2/ncm2-ultisnips
"     45. sirver/ultisnips
"     46. ncm2/ncm2-path
"     47. ncm2/ncm2-tagprefix
"     48. ncm2/ncm2-cssomni
"     49. ncm2/ncm2-tern
"     50. ncm2/ncm2-html-subscope
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
		\ 'php': ['phpcs'],
		\ 'less': ['stylelint'],
		\ 'css': ['stylelint'],
		\ 'sass': ['stylelint'],
		\ 'json': ['prettier'],
		\ 'graphql': ['prettier'],
		\ 'vue': ['stylelint', 'eslint', 'prettier'],
		\ }
	let g:ale_fixers = {}
	let g:ale_fixers.less = ['stylelint']
	let g:ale_fixers.css = ['stylelint']
	let g:ale_fixers.sass = ['stylelint']
	let g:ale_fixers.vue = ['stylelint', 'eslint', 'prettier']

	nmap <silent> [W <Plug>(ale_first)
	nmap <silent> [w <Plug>(ale_previous)
	nmap <silent> ]w <Plug>(ale_next)
	nmap <silent> ]W <Plug>(ale_last)

	let g:ale_sign_column_always = 1
	let g:airline#extensions#ale#enabled = 1
	let g:ale_sign_error = '•'
	let g:ale_sign_warning = '•'
	let g:ale_linters_explicit = 1
	let g:ale_fix_on_save = 1
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

	let test#javascript#mocha#options = '--webpack-config=node_modules/laravel-mix/setup/webpack.config.js --require tests/JavaScript/setup.js'


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


" 15. Fugitive, mainly for git diffs and blames (but also other things)
"     <https://github.com/tpope/vim-fugitive>
"
	call minpac#add('tpope/vim-fugitive')
	noremap <Leader>gb :Gblame<CR>
	noremap <Leader>gd :Gdiff<CR>


" 16. Emmet for expanding abbreviations
"     <https://github.com/mattn/emmet-vim>
"
	call minpac#add('mattn/emmet-vim')


" 17. QFEnter for opening items from the quickfix window similar to FZF
"     <https://github.com/yssl/QFEnter>
"
	call minpac#add('yssl/QFEnter')
	let g:qfenter_keymap = {}
	let g:qfenter_keymap.open = ['<CR>']
	let g:qfenter_keymap.vopen = ['<C-v>']
	let g:qfenter_keymap.hopen = ['<C-x>', '<C-CR>', '<C-s>']
	let g:qfenter_keymap.topen = ['<C-t>']


" 18. Repeat for repeating plugin actions
"     <https://github.com/tpope/vim-repeat>
"
	call minpac#add('tpope/vim-repeat')


" 19. Dash.vim for searching for documentation
"     <https://github.com/rizzatti/dash.vim>
"
	call minpac#add('rizzatti/dash.vim')
	nmap <silent> <Leader>d <Plug>DashSearch


" 20. Search and play iTunes tracks in vim.
"     <https://github.com/chew-z/itunes.vim>
"
	call minpac#add('chew-z/itunes.vim')
	let g:itunes_online = 1
	nnoremap <Leader><Leader>t :Tunes


" 21. WakaTime for tracking time
"     <https://github.com/wakatime/vim-wakatime>
"
	call minpac#add('wakatime/vim-wakatime')


" 22. Close (X)HTML tags
"     <https://github.com/alvan/vim-closetag>
"
	call minpac#add('alvan/vim-closetag')
	let g:closetag_filetypes = 'html,xhtml,phtml,php,vue,jsx,xml'


" ### Language-specific
"
" #### Elixir
"
	au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
	au BufRead,BufNewFile *.eex set filetype=eelixir


" 23. Endwise for auto-closing `do-end` methods
"    <https://github.com/tpope/vim-endwise>
"
	call minpac#add('tpope/vim-endwise')


" 24. Add text object support for Elixir blocks
"    <https://github.com/andyl/vim-textobj-elixir>
"
"    @dependency 'kana/vim-textobj-user'
"
	call minpac#add('andyl/vim-textobj-elixir')


" 25. Alchemist for insider info about Elixir projects using ElixirSense
"    <https://github.com/slashmili/alchemist.vim>
"
	call minpac#add('slashmili/alchemist.vim')
	let g:alchemist#elixir_erlang_src = "~/.asdf/shims/elixir"


" 26. Syntax highlighting and additional support for Elixir
"    <https://github.com/elixir-editors/vim-elixir>
"
	call minpac#add('elixir-editors/vim-elixir')


" #### PHP
"
" 27. Vim composer for navigating files via composer autoload
"     <https://github.com/noahfrederick/vim-composer>
"
	call minpac#add('noahfrederick/vim-composer')
	autocmd User Composer nmap <Leader>nf <Plug>(composer-find)
	autocmd User Composer nmap <Leader>u <Plug>(composer-use)<CR>


" 28. Projectionist for project configuration (specifically used for
"     vim-laravel)
"     <https://github.com/tpope/vim-projectionist>
"
	call minpac#add('tpope/vim-projectionist')


" 29. Vim laravel for running artisan commands in-editor
"     <https://github.com/noahfrederick/vim-laravel>
"
	call minpac#add('noahfrederick/vim-laravel')


" 30. Indentation and syntax highlighting for blade templates
"    <https://github.com/jwalton512/vim-blade>
"
	call minpac#add('jwalton512/vim-blade')

" 31. Just debug things
"     <https://github.com/vim-vdebug/vdebug>
"
	call minpac#add('vim-vdebug/vdebug')


" #### JavaScript
"
" 32. Syntax for Vue component files
"    <https://github.com/posva/vim-vue>
"
	call minpac#add('posva/vim-vue')


" 33. GraphQL syntax highlighting
"     <https://github.com/jparise/vim-graphql>
"
	call minpac#add('jparise/vim-graphql')


" 34. Base JavaScript syntax highlighting--used for JSX highlighting
"    <https://github.com/pangloss/vim-javascript>
"
	call minpac#add('pangloss/vim-javascript')
	let g:javascript_plugin_jsdoc = 1


" 35. JSX syntax highlighting and indenting
"    <https://github.com/mxw/vim-jsx>
"
	call minpac#add('mxw/vim-jsx')


" 36. Typescript syntax highlighting
"     <https://github.com/leafgarland/typescript-vim>
"
	call minpac#add('leafgarland/typescript-vim')


" 37. Typescript auto-completion
"     <https://github.com/Quramy/tsuquyomi>
"
	call minpac#add('Quramy/tsuquyomi')


" #### LESS
"
" 38. Vim syntax for LESS
"    <https://github.com/groenewege/vim-less>
"
	call minpac#add('groenewege/vim-less')


" #### Colorschemes
"
" 39. Vim Code Dark Colorscheme, a riff on Visual Studio's colorscheme
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
" 40. ncm2
" 41. roxma/nvim-yarp
" 42. ncm2/ncm2-bufword
" 43. autozimu/LanguageClient-neovim
" 44. ncm2/ncm2-ultisnips
" 45. sirver/ultisnips
" 46. ncm2/ncm2-path
" 47. ncm2/ncm2-tagprefix
" 48. ncm2/ncm2-cssomni
" 49. ncm2/ncm2-tern
" 50. ncm2/ncm2-html-subscope
"
	let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
	let $NVIM_PYTHON_LOG_LEVEL="DEBUG"
	let g:python2_host_prog = '/usr/local/bin/python2'
	let g:python3_host_prog = '/usr/local/bin/python3'

	call minpac#add('roxma/nvim-yarp')
	call minpac#add('ncm2/ncm2')

	autocmd BufEnter * call ncm2#enable_for_buffer()
	set shortmess+=c
	inoremap <C-c> <ESC>

	au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
	au User Ncm2PopupClose set completeopt=menuone

	" JakeBecker/elixir-ls                 " Elixir
	" vuejs/vetur                          " Vue
	" tern                                 " JavaScript
	" felixbecker/php-language-server      " PHP
	" microsoft/vscode-css-languageserver  " CSS

	call minpac#add('autozimu/LanguageClient-neovim', {
		\ 'branch': 'next',
		\ 'do': '!bash install.sh',
		\ })
	let g:LanguageClient_serverCommands = {
		\ 'elixir': ['sh', '~/.language-servers/elixir/language_server.sh'],
		\ 'vue': ['sh', '~/.language-servers/vue/vetur/server/bin/vls'],
		\ 'php': ['php', '~/.language-servers/php/vendor/felixfbecker/language-server/bin/php-language-server.php'],
		\ 'css': ['~/.language-servers/css/node_modules/.bin/css-languageserver --stdio'],
		\ }

	call minpac#add('ncm2/ncm2-ultisnips')
	call minpac#add('SirVer/ultisnips')

	let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
	let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
	let g:UltiSnipsRemoveSelectModeMappings = 0

	call minpac#add('ncm2/ncm2-bufword')
	call minpac#add('ncm2/ncm2-path')
	call minpac#add('ncm2/ncm2-tagprefix')
	call minpac#add('ncm2/ncm2-cssomni')
	call minpac#add('ncm2/ncm2-tern', {
		\ 'do': '!npm install'
		\ })
	call minpac#add('ncm2/ncm2-html-subscope')
	call minpac#add('ncm2/nvim-typescript', {
		\ 'for': 'typescript',
		\ 'do': './install.sh'
		\ })
