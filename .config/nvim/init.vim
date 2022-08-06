"__     ___
"\ \   / (_)_ __ ___  _ __ ___
" \ \ / /| | '_ ` _ \| '__/ __|
"  \ V / | | | | | | | | | (__
"   \_/  |_|_| |_| |_|_|  \___|

" Fundamentals "{{{
" ---------------------------------------------------------------------

" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

" set guicursor=
set nocompatible
set number
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set title
set autoindent
set background=dark
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set expandtab
set relativenumber
set incsearch
"let loaded_matchparen = 1
set shell=fish
set backupskip=/tmp/*,/private/tmp/*

" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

set nosc noru nosm
" Don't redraw while executing macros (good performance config)
set lazyredraw
"set showmatch
" How many tenths of a second to blink when matching brackets
"set mat=2
" Ignore case when searching
set ignorecase
" Be smart when using tabs ;)
set smarttab
" indents
filetype plugin indent on
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" Add asterisks in block comments
set formatoptions+=r
set clipboard+=unnamedplus

"}}}

"Highlights "{{{
" ---------------------------------------------------------------------
"set cursorline
"set cursorcolumn
set nocursorline
if has('autocmd')
    augroup coloroverride
        autocmd!
        autocmd ColorScheme * highlight LineNr guifg=#7fa2ac
    augroup END
endif
silent! colorscheme eldar " Custom color scheme

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40


if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

"}}}
  
" File types "{{{
" --------------------------------------------------------------------
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript
" Fish
au BufNewFile,BufRead *.fish set filetype=fish
" scheme
au BufNewFile,BufRead *.scm set filetype=scheme


set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd Filetype python setlocal tabstop=4 shiftwidth=4
autocmd Filetype javascript setlocal tabstop=4 shiftwidth=4
autocmd Filetype c setlocal tabstop=4 shiftwidth=4
autocmd Filetype scheme setlocal tabstop=4 shiftwidth=4 nonumber norelativenumber
"}}}

" Imports "{{{
" ---------------------------------------------------------------------
runtime ./plug.vim
runtime ./maps.vim
"}}}

" Syntax theme "{{{
" ---------------------------------------------------------------------
" Status line
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
let g:Hexokinase_highlighters = [ 'backgroundfull' ]
" All possible highlighters
"let g:Hexokinase_highlighters = [
"\   'virtual',
"\   'sign_column',
"\   'background',
"\   'backgroundfull',
"\   'foreground',
"\   'foregroundfull'
"\ ]
" Patterns to match for all filetypes
" Can be a comma separated string or a list of strings
" Default value:
"let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla,colour_names'

" All possible values
"let g:Hexokinase_optInPatterns = [
"\     'full_hex',
"\     'triple_hex',
"\     'rgb',
"\     'rgba',
"\     'hsl',
"\     'hsla',
"\     'colour_names'
"\ ]

" Filetype specific patterns to match
" entry value must be comma seperated list
"let g:Hexokinase_ftOptInPatterns = {
"\     'css': 'full_hex,rgb,rgba,hsl,hsla,colour_names',
"\     'html': 'full_hex,rgb,rgba,hsl,hsla,colour_names'
"\ }
autocmd VimEnter * HexokinaseTurnOn 
" true color
syntax enable
set termguicolors
set winblend=0
set wildoptions=pum
set pumblend=5
set background=dark
" Use gruvbox
colorscheme gruvbox
"autocmd vimenter * ++nested colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
autocmd VimEnter * hi Normal ctermbg=none
highlight clear SignColumn
"}}}

"  Extras "{{{
" ---------------------------------------------------------------------
set nohlsearch
set exrc
syntax match keyword "\<lambda\>" conceal cchar=λ
"let g:deoplete#enable_at_startup = 1
"}}}

" vim: set foldmethod=marker foldlevel=0:
  
