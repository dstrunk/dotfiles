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
" Plugin index (25 total plugins installed including 'minpac')
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
"      9. 'Shougo/deoplete.nvim'
"      10. 'autozimu/LanguageClient-neovim'
"      11. 'jiangmiao/auto-pairs'
"      12. 'sirver/ultisnips'
"      13. 'airblade/vim-gitgutter'
"      14. 'ludovicchabant/vim-gutentags'
"      15. 'kana/vim-textobj-user'
"      16. 'christoomey/vim-tmux-navigator'
"      17. 'christoomey/vim-tmux-runner'
"      18. 'jreybert/magit'
"
"  ### Language-specific
"
"  #### Elixir
"
"      1. 'tpope/vim-endwise'
"      2. 'andyl/vim-textobj-elixir'
"      3. 'slashmili/alchemist.vim'
"      4. 'elixir-editors/vim-elixir'
"
"  #### PHP
"
"      1. 'roxma/LanguageServer-php-neovim'
"
"  #### JavaScript
"
"  #### Colorschemes
"
"      1. 'tomasiser/vim-code-dark'
"
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
	\	'javascript': ['eslint'],
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

" 9. Deoplete for autocompletion
"    <https://github.com/Shougo/deoplete.nvim>
"
"    @dependency 'autozimu/LanguageClient-neovim'
"
	call minpac#add('Shougo/deoplete.nvim')
	let g:deoplete#enable_at_startup=1
	let g:deoplete#enable_smart_case=1
	let b:deoplete_disable_auto_complete=1
	let g:deoplete_disable_auto_complete=1
	let g:deoplete#auto_complete_delay=0
	let g:deoplete#sources = {}
	let g:deoplete#sources.php = ['LanguageClient']
	autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


" 10. Language client for supporting autocomplete / omnicompletion for languages
"     <https://github.com/autozimu/LanguageClient-neovim>
"
"     @setup `./install.sh`
"
	call minpac#add('autozimu/LanguageClient-neovim', {
		\ 'do': '!./install.sh'
	\ })
	set hidden
	let g:LanguageClient_autoStart = 1
	let g:LanguageClient_serverCommands = {
		\ 'php': ['php', '~/.language-servers/intelephense/bin/php_doc_scrape.php'],
		\ }


" 11. Autopairs for auto-inserting or -removing parenthesis, squiggly
"     brackets, etc.
"     <https://github.com/jiangmiao/auto-pairs>
"
	call minpac#add('jiangmiao/auto-pairs')


" 12. Ultisnips for snippets
"     <https://github.com/sirver/ultisnips>
"
	call minpac#add('sirver/ultisnips')
	let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsJumpForwardTrigger="<c-n>"
	let g:UltiSnipsJumpBackwardTrigger="<c-p>"


" 13. Gitgutter for a gutter notification of changes
"     <https://github.com/airblade/vim-gitgutter>
"
	call minpac#add('airblade/vim-gitgutter')


" 14. Gutentags for keeping tags files up-to-date
"     <https://github.com/ludovicchabant/vim-gutentags>
"
	call minpac#add('ludovicchabant/vim-gutentags')
	let g:gutentags_generate_on_empty_buffer = 1
	let g:gutentags_cache_dir = '~/.gutentags'

	let g:gutentags_project_info = []
	call add(g:gutentags_project_info, {'type': 'php', 'file': 'composer.json'})
	let g:gutentags_ctags_executable_php = 'ctags -R --language-force=php --php-kinds=cfit --output-format=u-ctags'


" 15. Create your own text objects! Used in Elixir and other deps
"     <https://github.com/kana/vim-textobj-user>
"
	call minpac#add('kana/vim-textobj-user')


" 16. Navigate tmux and vim seamlessly
"     <https://github.com/christoomey/vim-tmux-navigator>
"
	call minpac#add('christoomey/vim-tmux-navigator')


" 17. Send vim lines to tmux panes. Useful for testing within 'vim-test' using
"     the 'vtr' strategy.
"     <https://github.com/christoomey/vim-tmux-runner>
"
	call minpac#add('christoomey/vim-tmux-runner')
	map <Leader>fr :VtrFocusRunner<CR>
	nmap <C-f> :VtrSendLinesToRunner<CR>
	vmap <C-f> :VtrSendLinesToRunner<CR>


" 18. Magit for easing git workflow within vim. Based on Magit for Emacs.
"     <https://github.com/jreybert/vimagit>
"
	call minpac#add('jreybert/vimagit')


" ### Language-specific
"
" #### Elixir
"
	au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
	au BufRead,BufNewFile *.eex set filetype=eelixir


" 1. Endwise for auto-closing `do-end` methods
"    <https://github.com/tpope/vim-endwise>
"
	call minpac#add('tpope/vim-endwise')


" 2. Add text object support for Elixir blocks
"    <https://github.com/andyl/vim-textobj-elixir>
"
"    @dependency 'kana/vim-textobj-user'
"
	call minpac#add('andyl/vim-textobj-elixir')


" 3. Alchemist for insider info about Elixir projects using ElixirSense
"    <https://github.com/slashmili/alchemist.vim>
"
	call minpac#add('slashmili/alchemist.vim')


" 4. Syntax highlighting and additional support for Elixir
"    <https://github.com/elixir-editors/vim-elixir>
"
	call minpac#add('elixir-editors/vim-elixir')


" #### PHP
"
" 1. Language server for PHP
"    <https://github.com/roxma/LanguageServer-php-neovim>
"
"    @external-depencency 'felixfbecker/php-language-server'
"
"        ```sh
"        git clone https://github.com/felixfbecker/php-language-server.git ~/.tooling/php-language-server
"        cd ~/.tooling/php-language-server
"        composer install
"        composer parse-stubs
"        ```
"
"    @setup '!composer install && composer run-script parse-stubs'
"
	call minpac#add('roxma/LanguageServer-php-neovim', {
		\ 'do': '!composer install && composer run-script parse-stubs'
	\ })


" #### JavaScript
"


" #### Colorschemes
"
" 1. Vim Code Dark Colorscheme, a riff on Visual Studio's colorscheme
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
