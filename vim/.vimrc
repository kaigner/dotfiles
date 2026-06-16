

" ---------------------------------------------
" Init - plugins
" ---------------------------------------------
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'

Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale'
call plug#end()

" Vim Options
set nocompatible		" Disable VI Compatibility
set autoindent			" Default to indenting files
set backspace=indent,eol,start	" Backspace all characters
set formatoptions-=t		" Don't add line-breaks for lines over 'textwidth' characters
set hlsearch			" Highlight search results
set nostartofline		" Do not jump to first character with page commands
set ruler			" Enable the ruler
set showmatch			" Show matching brackets.
set showmode			" Show the current mode in status line
set showcmd			" Show partial command in status line
set tabstop=4			" Number of spaces <tab> counts for
"set textwidth=80		" 80 columns
set title			" Set the title
set number
set relativenumber

" Theme / Color Scheme
set background=light            " Light background is best
hi Comment ctermfg=63		" Brighten up comment colors

" Aliases
cmap w!! w !sudo tee > /dev/null %

" File/Indenting and Syntax Highlighting
if has("autocmd")
	filetype plugin indent on

	" Jump to previous cursor location, unless it's a commit message
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
	autocmd BufReadPost COMMIT_EDITMSG exe "normal! gg"

	" Yaml
	autocmd BufNewFile,BufRead                  *.yaml,*.yml setlocal filetype=yaml
	autocmd FileType                            yaml         setlocal sw=2 sts=2 et

	" JavaScript files
	autocmd BufNewFile,BufReadPre,FileReadPre   *.js        setlocal filetype=javascript
	autocmd FileType                            javascript  setlocal sw=4 sts=4 et

	" JSON files
	autocmd BufNewFile,BufReadPre,FileReadPre   *.json setlocal filetype=json
	autocmd FileType                            json   setlocal sw=2 sts=2 et


	" Python files
	autocmd BufNewFile,BufReadPre,FileReadPre   *.py   setlocal filetype=python
	autocmd FileType 							python setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4 autoindent

	" Markdown files
	autocmd BufNewFile,BufRead,FileReadPre      *.md,*.markdown setlocal filetype=markdown
	autocmd FileType                            markdown      setlocal sw=4 sts=4 et spell

	" Jekyll posts ignore yaml headers
	autocmd BufNewFile,BufRead                  */_posts/*.md syntax match Comment /\%^---\_.\{-}---$/
	autocmd BufNewFile,BufRead                  */_posts/*.md syntax region lqdHighlight start=/^{%\s*highlight\(\s\+\w\+\)\{0,1}\s*%}$/ end=/{%\s*endhighlight\s*%}/

	" EJS javascript templates
	autocmd BufNewFile,BufRead,FileReadPre      *.ejs setlocal filetype=html

	" TXT files
	autocmd FileType                            text setlocal spell
endif

" Highlight Unwanted Whitespace
highlight RedundantWhitespace ctermbg=green guibg=green
match RedundantWhitespace /\s\+$\| \+\ze\t/

" Spell Check Settings
set spelllang=en
highlight clear SpellBad
highlight SpellBad term=standout cterm=underline ctermfg=red
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" Plugins
let g:airline_powerline_fonts = 0
let g:airline_theme = "deus"
let g:rust_recommended_style = 1

let g:ale_linters = {
\  'bash': [],
\  'sh': [],
\  'c': [],
\  'rust': ['analyzer'],
\  'python': [],
\}
let g:ale_completion_enabled = 0
let g:ale_python_pylint_options = '--disable=C0103'
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
" Optional: Nur Fehler anzeigen, Warnungen ignorieren
" " let g:ale_linters_explicit = 1

let g:vim_markdown_folding_disabled = 1



" Source local config
if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif
if filereadable(expand("~/.vimrc.indent"))
	source ~/.vimrc.indent
endif
