" Addison Amiri's NeoVim Configuration

" Plugins {{{

call plug#begin()

Plug 'itchyny/calendar.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'Shougo/neocomplcache.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
Plug 'Shougo/unite.vim'
Plug 'lervag/vimtex'
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'easymotion/vim-easymotion', { 'on': '<plug>(easymotion-s)' }
Plug 'tpope/vim-fugitive'
Plug 'w0ng/vim-hybrid'
Plug 'terryma/vim-multiple-cursors'
Plug 'noahfrederick/vim-noctu'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'tpope/vim-surround'

call plug#end()

" }}}

" Colorschemes {{{

set background=light                            " Solarized light
colorscheme solarized
autocmd VimEnter * colorscheme solarized        " Fixing Truecolor Bug in Neovim (#2953)
autocmd VimEnter * AirlineTheme solarized

" }}}

" Basic Settings {{{

filetype plugin indent on                           " Detect filetypes
syntax on                                           " Syntax highlighting
set nospell                                         " No spellchecking by default
set mouse=a                                         " Enable mouse usage
set mousehide                                       " Hide mouse cursor while typing
set clipboard=unnamedplus                           " Use X clipboard
set history=1000                                    " Default is 50
set hidden                                          " Allow for buffer switching without saving
set undofile                                        " Persistent undos
set undodir=$HOME/.nvim/undo//                      " Set directory to store undos
set undolevels=1000                                 " Maximum number of changes that can be undone
set undoreload=10000                                " Maximum number of lines to save for undo on a buffer reload
set directory=$HOME/.nvim/backup//                  " Keep all backups in one place
set backupdir=$HOME/.nvim/swap//                    " Keep all swapfiles in one place
"set number                                          " Line numbers on
set incsearch                                       " Find as you search
set hlsearch                                        " Highlight search terms
set ignorecase                                      " Case insensitive search
set smartcase                                       " Case sensitive when uppercase is present
set list                                            " Show whitespace
set listchars=tab:―⇥,trail:•,extends:»,nbsp:.,eol:¬ " Characters to show
set wrap                                            " Wrap long lines
set conceallevel=2
set nojoinspaces                                    " Insert one space after join instead of 2 on punctuation
set splitright                                      " New vsplit windows appear on right
set splitbelow                                      " New split windows appear on bottom
let mapleader="\<Space>"                        " Space is my leader
let maplocalleader="\<CR>"

" Indentation {{{

set autoindent                                      " Copy indentation from previous line if nothing else
set shiftwidth=2                                    " Use indents of 2 spaces
set expandtab                                       " Tabs are spaces
set tabstop=2                                       " Indentation every 2 columns
set softtabstop=2                                   " Let backspace delete indent.

" }}}

" Statusline {{{

set showmode                                    " Display current mode
set laststatus=2                                " Always show statusline

" Statusline parts {{{
set statusline=%<%f\                            " Filename
set statusline+=%w%h%m%r                        " Options
set statusline+=\ [%{&ff}/%Y]                   " Filetype
set statusline+=\ [%{getcwd()}]                 " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%         " Right aligned file nav info

" }}}

" }}}

" }}}

" Notebooks {{{

" Set right settings for Markdown Files
autocmd bufnewfile,bufreadpre *.md setlocal shiftwidth=4 tabstop=4 textwidth=80 softtabstop=4 colorcolumn=80

" Open different notebooks {{{

nnoremap <silent> <leader>n :e ~/Documents/Work/index.md<CR>:Goyo<CR>
nnoremap <silent> <leader>nn :e ~/Documents/Work/this_week.md<CR>:Goyo<CR>
nnoremap <silent> <leader>na :e ~/Documents/Work/school/algorithms/index.md<CR>:Goyo<CR>
nnoremap <silent> <leader>ni :e ~/Documents/Work/school/infosec/index.md<CR>:Goyo<CR>
nnoremap <silent> <leader>np :e ~/Documents/Work/school/privacy/index.md<CR>:Goyo<CR>
nnoremap <silent> <leader>nd :e ~/Documents/Work/school/devices/index.md<CR>:Goyo<CR>
nnoremap <silent> <leader>nf :e ~/Documents/Work/school/farsi/index.md<CR>:Goyo<CR>

" }}}

" Local markdown mappings {{{

inoremap <buffer> <C-L> <Esc>I<Space><Space>-<Space><Esc>A

" }}}

" }}}

autocmd bufnewfile,bufreadpre *.txt setlocal textwidth=80 colorcolumn=80 " Set hard wraps on txt files
autocmd bufnewfile,bufreadpre *.go setlocal listchars+=tab:\ \  noexpandtab

set pastetoggle=<F12>                           " Toggle paste with F12

inoremap jk <Esc>

nmap <leader>wj <C-w>j
nmap <leader>wk <C-w>k
nmap <leader>wh <C-w>h
nmap <leader>wl <C-w>l
nmap <leader>w- <C-w>s
nmap <leader>w/ <C-w>v
nmap <leader>wc <C-W>c
nmap <leader>w= <C-w>=

nmap <silent> <leader>bn :bn<CR>
nmap <silent> <leader>bp :bp<CR>
nmap <silent> <leader>bb <C-^>
nmap          <leader>B :ls<CR>:b<Space>
nmap <silent> <leader>bd :bd<CR>

nnoremap H ^
nnoremap L g_
vnoremap H ^
vnoremap L g_

nmap <silent> <leader>/ :set invhlsearch<CR>

vnoremap < <gv
vnoremap > >gv

vnoremap . :normal .<CR>

cmap w!! w !sudo tee % >/dev/null

nmap <leader>at :terminal<CR>

tnoremap <esc> <C-\><C-n>
tnoremap <esc><esc> <esc>

" Plugin specific settings

" Goyo
nnoremap <leader>pg :Goyo<CR>

" Limelight
nnoremap <leader>pl :Limelight!!
" NERDTree
nnoremap <leader>ft :NERDTreeToggle<CR>

" Tabularize
nnoremap <leader>la :Tab /

" vimtex
let g:tex_conceal="abdgms"

" vim-airline
let g:airline_theme="solarized"
let g:airline_powerline_fonts = 1

" vim-easymotion
let g:EasyMotion_do_mapping = 0
nmap <leader><leader> <Plug>(easymotion-s)
"let g:EasyMotion_keys = "aoeuidhtns;,.pyfgcrl'qjkxbmwvz"
let g:EasyMotion_smartcase = 1

" vim-pandoc
let g:pandoc#formatting#mode = 'sA'
let g:pandoc#formatting#textwidth = 80

let g:pandoc#folding#level = 3
let g:pandoc#folding#foldyaml = 1
let g:pandoc#folding#fold_fenced_codeblocks = 1

let g:pandoc#hypertext#autosave_on_edit_open_link = 1
let g:pandoc#hypertext#create_if_no_alternates_exists = 1

" vim-pandoc-syntax
let g:pandoc#syntax#conceal#urls = 1
let g:pandoc#syntax#codeblocks#embeds#langs = ["c"]

" vim-taskwarrior
nnoremap <leader>tt :TW<CR>

" vim:fdm=marker
